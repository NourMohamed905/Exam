import 'package:dio/dio.dart';

class Failure {
  final String message;

  Failure({required this.message});
}

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return Failure(message: "Connection timeout");

        case DioExceptionType.sendTimeout:
          return Failure(message: "Send timeout");

        case DioExceptionType.receiveTimeout:
          return Failure(message: "Receive timeout");

        case DioExceptionType.badResponse:
          return Failure(
            message: error.response?.data["message"] ?? "Server error",
          );

        case DioExceptionType.connectionError:
          return Failure(message: "No Internet Connection");

        default:
          return Failure(message: "Unexpected error occurred");
      }
    }

    return Failure(message: "Unknown error occurred");
  }
}
