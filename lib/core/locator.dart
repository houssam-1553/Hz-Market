import 'package:dio/dio.dart';

// import 'package:flutter_localization/flutter_localization.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get_it/get_it.dart';

import 'package:hzmarket/config/config.dart';
import 'package:hzmarket/features/auth/data/remote_data_source/remote_dta.dart';
import 'package:hzmarket/features/auth/data/repo.dart';
final locator = GetIt.I;

Future<void> setupLocator() async {
  locator.registerSingleton<Dio>(Dio(Config.dioBaseOption));
  print("object");

  locator.registerSingleton<RemoteDataSource>(RemoteDataSource(baseUrl: "http://127.0.0.1:5555"));
 


  // locator.registerSingleton<FlutterLocalization>(FlutterLocalization.instance);
}
