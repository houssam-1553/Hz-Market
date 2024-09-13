import 'dart:async';
import 'dart:developer';
import 'package:hzmarket/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hzmarket/features/auth/data/models/market_model.dart';
import 'package:hzmarket/features/auth/data/models/user_model.dart';
import 'package:hzmarket/features/auth/data/remote_data_source/remote_dta.dart';
import 'package:hzmarket/features/auth/domain/repos/repo.dart';
import 'package:hzmarket/features/auth/data/local_data/secure_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SecureStorageService _secureStorageService = SecureStorageService();

  AuthRepositoryImpl();

  @override
  Future<({UserModel user, MarketModel market})> loginWithPassword(
      String phoneNumber,
      String password,
      RemoteDataSource remoteDataSource) async {
    try {
      log('Attempting login with phone: $phoneNumber, password: $password');

      final response = await remoteDataSource.postRequest(
        "/login",
        responseHandling: false,
        data: {
          "phone": phoneNumber,
          "password": password,
        },
      );
      log('Response received with status code: ${response.statusCode}');
      log('Response data: ${response.data}');

      switch (response.statusCode) {
        case 200:
          String token = response.data['token'];
          await _secureStorageService.storeToken(token);
          log('Stored token: $token');

          log('Response user data: ${response.data}');

          final user = UserModel.fromMap(response.data['id'] ?? {});
          final market = MarketModel.example();

          return (user: user, market: market);
        case 401:
          log('Authentication failed: wrong credentials');
          throw AppException(
            message: 'Wrong credentials'.trim(),
            statusCode: response.statusCode,
          );
        case 404:
          log('Account not found');
          throw AppException(
            message: 'Wrong credentials'.trim(),
            statusCode: response.statusCode,
          );
        case 400:
          log('Bad request: ${response.data['msg'] ?? 'Empty field(s)'}');
          throw AppException(
            message: 'Empty field(s)'.trim(),
            statusCode: response.statusCode,
          );
        case 402:
          throw AppException(
            message: 'Suspended account'.trim(),
            statusCode: response.statusCode,
          );
        default:
          log('Unexpected error: ${response.statusCode}');
          throw AppException(
            message: 'somethingWrong'.trim(),
            statusCode: response.statusCode,
          );
      }
    } catch (e, stackTrace) {
      log(' $e');
      log('Stack trace: $stackTrace');
      rethrow;
    }
  }

  @override
  Future<bool> signUp(
      RemoteDataSource remoteDataSource,
      String? name,
      String? password,
      String? phoneNumber,
      String? brand) async {
    try {
      log('Attempting sign up with password: $password, phone: $phoneNumber, name: $name, brand: $brand,');

      final response = await remoteDataSource.postRequest(
        "/signup/account/create",
        responseHandling: false,
        data: {
          "password": password,
          "phone": phoneNumber,
          "fullname": name,
          "brand": brand,
        },
      );
      log('Response received with status code: ${response.statusCode}');
      log('Response data: ${response.data}');

      switch (response.statusCode) {
        case 200: // Assuming 201 is the status code for successful signup
          log('Response user data: ${response.data}');
          return true;
        case 400:
          log('Bad request: ${response.data['msg'] ?? 'Empty field(s)'}');
          throw AppException(
            message: 'Empty field(s)'.trim(),
            statusCode: response.statusCode,
          );
        default:
          log('Unexpected error: ${response.statusCode}');
          throw AppException(
            message: 'somethingWrong'.trim(),
            statusCode: response.statusCode,
          );
      }
    } catch (e, stackTrace) {
      log(' $e');
      log('Stack trace: $stackTrace');
      rethrow;
    }
  }

  @override
  Future<bool> sendOtpCode(
      String phoneNumber, RemoteDataSource remoteDataSource) async {
    try {
      log('Attempting OTP send with phone: $phoneNumber,');

      final response = await remoteDataSource.postRequest(
        "/login/otp/send",
        responseHandling: false,
        data: {
          "phone": phoneNumber,
        },
      );
      log('Response received with status code: ${response.statusCode}');
      log('Response data: ${response.data}');

      switch (response.statusCode) {
        case 200:
          log('Received ${response.data}');
          return true;
        case 400:
          log('Bad request: ${response.data['msg'] ?? 'Empty field(s)'}');
          throw AppException(
            message: 'Empty field(s)'.trim(),
            statusCode: response.statusCode,
          );
        default:
          log('Unexpected error: ${response.statusCode}');
          throw AppException(
            message: 'somethingWrong'.trim(),
            statusCode: response.statusCode,
          );
      }
    } catch (e, stackTrace) {
      log(' $e');
      log('Stack trace: $stackTrace');
      rethrow;
    }
  }

  @override
  Future<bool> verifyOtpCode(
      String phoneNumber, String code, RemoteDataSource remoteDataSource) async {
    try {
      log('Attempting OTP verify with phone: $phoneNumber, code: $code');

      final response = await remoteDataSource.postRequest(
        "/login/otp/verify",
        responseHandling: false,
        data: {
          "phone": phoneNumber,
          "code": code,
        },
      );
      log('Response received with status code: ${response.statusCode}');
      log('Response data: ${response.data}');

      switch (response.statusCode) {
        case 200:
          log('Received ${response.data}');
          return true;
        case 400:
          log('Bad request: ${response.data['msg'] ?? 'Empty field(s)'}');
          throw AppException(
            message: 'Empty field(s)'.trim(),
            statusCode: response.statusCode,
          );
        default:
          log('Unexpected error: ${response.statusCode}');
          throw AppException(
            message: 'somethingWrong'.trim(),
            statusCode: response.statusCode,
          );
      }
    } catch (e, stackTrace) {
      log(' $e');
      log('Stack trace: $stackTrace');
      rethrow;
    }
  }
}
