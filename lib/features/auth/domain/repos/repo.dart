import 'package:hzmarket/core/error/failure.dart';
import 'package:hzmarket/core/resources/data_state.dart';
import 'package:hzmarket/features/auth/data/models/market_model.dart';
import 'package:hzmarket/features/auth/data/models/user_model.dart';
import 'package:hzmarket/features/auth/data/remote_data_source/remote_dta.dart';

import 'package:hzmarket/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  
  
  
   Future<({UserModel user, MarketModel market})> loginWithPassword(
      String phoneNumber, String password,RemoteDataSource remoteDataSource);
      Future<bool> signUp(
        RemoteDataSource remoteDataSource,
    String password,
    String phone,
    String fullname,
    String brand,
      );

  sendOtpCode(String phone, RemoteDataSource remoteDataSource) {}
   verifyOtpCode(String phone, String code, RemoteDataSource remoteDataSource) {}
}
