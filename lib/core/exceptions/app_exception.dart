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
