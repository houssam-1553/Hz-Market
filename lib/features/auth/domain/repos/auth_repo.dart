
import 'package:hzmarket/core/error/failure.dart';
import 'package:hzmarket/core/resources/data_state.dart';
import 'package:hzmarket/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract  class authRepo {
  Future<DataState<List<UserEntity>>> getUser();
  Future<Either<Failure, String>> signup({
    required String name ,
    required String email ,
    required String password ,

  });
   Future<Either<Failure, String>> signin({
    
    required String email ,
    required String password ,

  });
  }