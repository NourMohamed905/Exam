import 'package:exam_app/core/models/auth_response_dto.dart';
import 'package:exam_app/features/auth/login/data/model/login_request_dto.dart';

abstract class LoginRemoteDataSourceContract {
  Future<AuthResponseDTO> login(LoginRequestDTO loginRequest);
}
