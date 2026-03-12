import 'package:dio/dio.dart';
import 'package:exam_app/core/constants/app_endpoints.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {

  @lazySingleton
  Dio provideDio() {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: AppEndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    return dio;
  }
}