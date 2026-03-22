import 'package:exam_app/core/models/auth_response_dto.dart';
import 'package:exam_app/features/auth/signup/data/model/signup_request_dto.dart';

abstract class SignupRemoteDataSourceContract {
  Future<AuthResponseDTO> signup(SignupRequestDTO signupRequest);
}
