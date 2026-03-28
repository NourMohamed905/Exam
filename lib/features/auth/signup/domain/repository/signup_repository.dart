import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/signup/domain/entity/signup_request.dart';
import 'package:exam_app/features/auth/signup/domain/entity/signup_response.dart';

abstract class SignupRepoContract {
  Future<BaseResponse<SignupResponse>> signup(SignupRequest signupRequest);
}
