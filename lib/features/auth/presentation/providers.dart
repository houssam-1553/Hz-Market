import 'dart:async'; // Required for the StreamController
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hzmarket/core/enums/response_state.dart';
import 'package:hzmarket/core/response_model.dart';
import 'package:hzmarket/features/auth/data/models/market_model.dart';
import 'package:hzmarket/features/auth/data/models/user_model.dart';
import 'package:hzmarket/features/auth/data/remote_data_source/remote_dta.dart';
import 'package:hzmarket/features/auth/domain/repos/repo.dart';
import 'package:hzmarket/features/home/presentation/screens/home_screen/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthProvider(this._authRepository);
  RemoteDataSource remoteDataSource =
      RemoteDataSource(baseUrl: "https://hz-node.onrender.com");

  final ResponseModel<String?> informationVerification = ResponseModel(
    status: Status.init,
    code: -1,
    payload: null,
  );
  final ResponseModel<String?> otpSending = ResponseModel(
    status: Status.init,
    payload: null,
  );

  ResponseModel<({UserModel? user, MarketModel? market})> userDataReponse =
      ResponseModel(
    payload: (user: null, market: null),
    status: Status.loading,
  );

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  Future<bool> loginWithPassword(BuildContext context,
      {required String phone, required String password}) async {
    try {
      informationVerification.status = Status.loading;
      notifyListeners();

      log('Phone: $phone');
      log('Password: $password');

      phone = phone.replaceAll(RegExp(r' '), '');
      userDataReponse.status = Status.loading;

      await _authRepository
          .loginWithPassword(phone, password, remoteDataSource)
          .then((value) {
        userDataReponse.status = Status.completed;
        informationVerification.status = Status.completed;
        notifyListeners();
        userDataReponse.payload = value;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });

      return true;
    } on AppException catch (e) {
      log('AppException: ${e.message}');
      informationVerification.status = Status.error;
      informationVerification.payload = e.message;
      informationVerification.code = e.statusCode;

      notifyListeners();
    } on Exception catch (e) {
      log('Exception: $e');
      informationVerification.status = Status.error;
      notifyListeners();
    }
    return false;
  }
String phoneSignup= "";
  Future<bool> signUp(
    BuildContext context, {
    required String name,
    required String password,
    required String phone,
    required String brand,
  }) async {
    try {
      
      notifyListeners();

      log('Name: $name');

      log('Password: $password');
      log('Phone: $phone');
      log('Brand: $brand');

      // Any necessary data transformations or validations can be done here

      userDataReponse.status = Status.loading;

      await _authRepository
          .signUp(
        remoteDataSource,
        name,
        password,
        phone,
        brand,
      )
          .then((value) {
       
       showPinCodeScreen =true ;
        notifyListeners();
      phoneSignup = phone ; 
   phoneotp= "";
      });

      return true;
    } on AppException catch (e) {
      log('AppException: ${e.message}');
      informationVerification.status = Status.error;
      informationVerification.payload = e.message;
      informationVerification.code = e.statusCode;
       showPinCodeScreen = false;

      notifyListeners();
      return false;
    } on Exception catch (e) {
      log('Exception: $e');
      informationVerification.status = Status.error;
       showPinCodeScreen =false;
      notifyListeners();
    }
    return false;
  }
  Future<bool> testConnection() async {
    try {
      final response = await remoteDataSource.postRequest(
        '/login',
       
          responseHandling: false,
      data:  {"phone": "0795912431",
         "password": "12341234"},
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log('Connection test failed: $e');
    }
    return false;
  }
  
  

String phoneotp = "";
  Future<bool> sendOtpCode(String phone) async {
    try {
      otpSending.status = Status.loading;
      notifyListeners();

      // Remove any spaces from the phone number
      phone = phone.replaceAll(RegExp(r' '), '');
   phoneotp = phone ; 
   phoneSignup= "";
log(phoneotp);
      await _authRepository.sendOtpCode(phone, remoteDataSource);
      if (await _authRepository.sendOtpCode(phone, remoteDataSource)) {
        showPinCodeScreen = true;

      } else {
        showPinCodeScreen = false;
      }

      otpSending.status = Status.completed;

      notifyListeners();
      otpSending.status = Status.init;
      notifyListeners();
       return true;
    } on AppException catch (e) {
      otpSending.status = Status.error;
      otpSending.payload = e.message;
      showPinCodeScreen = false;
       informationVerification.code = e.statusCode;
      notifyListeners();
    } on Exception catch (e) {
      log('Exception: $e');
      otpSending.status = Status.error;
      showPinCodeScreen = false;
      otpSending.payload = 'An unexpected error occurred.';
      notifyListeners();
    }
    return false;
  }
    Future<bool> verifyOtpCode(String code) async {
    try {
    

      // Remove any spaces from the phone number
      String phone = ""  ;
         if (phoneSignup== ""){
     phone = phoneotp  ;
      }else{
        phone = phoneSignup ;
      }
     log("potp"+phoneotp);
      log("psignup"+phoneSignup);

      await _authRepository.verifyOtpCode(phone,code, remoteDataSource);
    

    

      
       return true;
    } on AppException catch (e) {
      otpSending.status = Status.error;
      otpSending.payload = e.message;
    
       informationVerification.code = e.statusCode;
      notifyListeners();
    } on Exception catch (e) {
      log('Exception: $e');
      otpSending.status = Status.error;
     
      otpSending.payload = 'An unexpected error occurred.';
      notifyListeners();
    }
    return false;
  }

  bool _showPinCodeScreen = false;

  bool get showPinCodeScreen => _showPinCodeScreen;

  set showPinCodeScreen(bool value) {
    _showPinCodeScreen = value;
    notifyListeners();
  }

  final TabController tabController =
      TabController(length: 3, vsync: CustomTickerProvider());

  @override
  void dispose() {
    tabController.dispose();
    phoneController.dispose();
    otpController.dispose();
    super.dispose();
  }
}

class CustomTickerProvider extends TickerProvider {
  @override
  Ticker createTicker(onTick) => Ticker(onTick);
}
