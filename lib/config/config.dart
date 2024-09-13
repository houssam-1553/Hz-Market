import 'package:dio/dio.dart';

import 'package:hzmarket/config/endpoints.dart';


class Config {
  static final dioBaseOption = BaseOptions(
    baseUrl: Endpoints.host,
    connectTimeout: Duration(
      seconds: 5,
    ).inMilliseconds, // Convert Duration to milliseconds
  );
}
