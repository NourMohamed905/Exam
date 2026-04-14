import 'package:dio/dio.dart';
import 'package:exam_app/core/error/app_error_massage.dart';

class Failure {
  final String message;

  Failure({required this.message});
}

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return Failure(message: AppMessages.connectionTimeout);

        case DioExceptionType.sendTimeout:
          return Failure(message: AppMessages.sendTimeout);

        case DioExceptionType.receiveTimeout:
          return Failure(message: AppMessages.receiveTimeout);

        case DioExceptionType.badResponse:
          return Failure(
            message: error.response?.data["message"] ?? AppMessages.serverError,
          );

        case DioExceptionType.connectionError:
          return Failure(message: AppMessages.noInternet);

        default:
          return Failure(message: AppMessages.unexpectedError);
      }
    }

    return Failure(message: AppMessages.unknownError);
  }
}
