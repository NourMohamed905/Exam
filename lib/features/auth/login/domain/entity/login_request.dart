import 'package:exam_app/features/auth/login/data/model/login_request_dto.dart';

class LoginRequest {
  String? email;
  String? password;

  LoginRequest({this.email, this.password});

  LoginRequestDTO toDTO() => LoginRequestDTO(email: email, password: password);
}
