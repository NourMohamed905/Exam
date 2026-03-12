import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiManager {
  final Dio dio;

  ApiManager(this.dio);

  Future<Response> getData(String endpoint) async {
    return await dio.get(endpoint);
  }

  Future<Response> postData(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    return await dio.post(endpoint, data: body);
  }

  Future<Response> putData(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    return await dio.put(endpoint, data: body);
  }

  Future<Response> deleteData(String endpoint) async {
    return await dio.delete(endpoint);
  }
}