import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/login/domain/entity/login_request.dart';
import 'package:exam_app/features/auth/login/domain/entity/login_response.dart';

abstract class LoginRepoContract {
  Future<BaseResponse<LoginResponse>> login(LoginRequest loginRequest);
}
