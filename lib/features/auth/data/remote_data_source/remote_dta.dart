import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class RemoteDataSource {
  final String baseUrl;
  late Dio _dio;

  RemoteDataSource({required this.baseUrl}) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  // Example function to send a POST request for login


  Future<Response> postRequest(
    String path, {
    required Map<String, dynamic> data,
    bool responseHandling = true,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: jsonEncode(data),
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      return _handleResponse(response, responseHandling);
    } catch (e) {
      return _handleDioError(e, path);
    }
  }

  Response _handleResponse(Response response, bool responseHandling) {
    if (!responseHandling) {
      return response;
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 400:
        throw AppException(message: 'Wrong phone or password', statusCode: response.statusCode);
      case 401:
        throw AppException(message: 'Wrong phone or password', statusCode: response.statusCode);
      case 404:
        throw AppException(message: 'Not Found', statusCode: response.statusCode);
      case 409:
        throw AppException(message: response.data['msg'] ?? 'Conflict', statusCode: response.statusCode);
      default:
        throw AppException(message: 'Something went wrong', statusCode: response.statusCode);
    }
  }

  Response _handleDioError(dynamic error, String path) {
    if (error is DioError) {
      if (error.response != null) {
        final statusCode = error.response!.statusCode!;
        final errorData = error.response!.data;
        final errorMessage = errorData['error'] ?? 'Unknown error occurred';
        return Response(
          statusCode: statusCode,
          requestOptions: RequestOptions(path: path),
          data: {'error': errorMessage},
        );
      } else {
        return Response(
          statusCode: -1, // Custom status code for network error
          requestOptions: RequestOptions(path: path),
          data: {'error': 'Network error occurred'},
        );
      }
    } else {
      return Response(
        statusCode: -1, // Custom status code for unknown error
        requestOptions: RequestOptions(path: path),
        data: {'error': 'An unknown error occurred'},
      );
    }
  }

 

  // Add other necessary functions here
}

class AppException implements Exception {
  final String? title;
  final String message;
  final int? statusCode;

  AppException.unexpected({this.statusCode, this.title = 'Error'})
      : message = 'There is something wrong!';

  AppException.unauthorized({
    this.statusCode,
    this.message = 'Unauthorized Connection',
    this.title = 'Error',
  });

  AppException.communicationError({
    this.statusCode,
    this.message = 'Unauthorized Connection',
    this.title = 'Error',
  });

  AppException({this.statusCode, this.title, required this.message});
}
