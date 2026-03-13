import 'package:exam_app/features/auth/signup/data/model/signup_request_dto.dart';

class SignupRequest {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  SignupRequest({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  SignupRequestDTO toDTO() => SignupRequestDTO(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );
}
