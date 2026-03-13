import 'package:dio/dio.dart';
import 'package:exam_app/core/constants/app_endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
@Injectable()
abstract class AuthApi {
  @factoryMethod
  factory AuthApi(Dio dio) = _AuthApi;

  @POST(AppEndPoints.signup)
  Future<HttpResponse> signup(@Body() Map<String, dynamic> body);
  @POST(AppEndPoints.login)
  Future<HttpResponse> login(@Body() Map<String, dynamic> body);
  @PATCH(AppEndPoints.changePassword)
  Future<HttpResponse> changePassword(@Body() Map<String, dynamic> body);
  @DELETE(AppEndPoints.deleteAccount)
  Future<HttpResponse> deleteAccount();
  @PATCH(AppEndPoints.editProfile)
  Future<HttpResponse> editProfile(@Body() Map<String, dynamic> body);
  @POST(AppEndPoints.logout)
  Future<HttpResponse> logout(@Body() Map<String, dynamic> body);
  @GET(AppEndPoints.getUserInfo)
  Future<HttpResponse> getUserInfo(@Body() Map<String, dynamic> body);
  @POST(AppEndPoints.forgotPassword)
  Future<HttpResponse> forgotPassword(@Body() Map<String, dynamic> body);
  @POST(AppEndPoints.verifyResetCode)
  Future<HttpResponse> verifyResetCode(@Body() Map<String, dynamic> body);
  @POST(AppEndPoints.resetPassword)
  Future<HttpResponse> resetPassword(@Body() Map<String, dynamic> body);
}
