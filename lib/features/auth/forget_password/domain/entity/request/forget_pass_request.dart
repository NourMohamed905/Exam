import 'package:exam_app/features/auth/forget_password/data/model/request/forget_pass_request_dto.dart';

class ForgetPasswordRequest {
  String? email;

  ForgetPasswordRequest({this.email});

  ForgetPasswordRequestDTO toDTO() {
    return ForgetPasswordRequestDTO(email: email);
  }
}
