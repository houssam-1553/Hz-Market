
import 'package:hzmarket/core/enums/response_state.dart';

class ResponseModel<T> {
  T payload;
  String? message;
  Status status;
  int? code;

  ResponseModel({
    required this.payload,
    required this.status,
    this.message,
    this.code
  });

  ResponseModel.init({required this.payload, this.status = Status.empty});

  @override
  String toString() =>
      'ResponseModel(payload: $payload, status: $status,message: $message)';
}
