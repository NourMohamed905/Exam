import 'package:exam_app/features/auth/forget_password/data/model/request/reset_pass_request_dto.dart';

class ResetPasswordRequest {
  String? email;
  String? newPassword;

  ResetPasswordRequest({this.email, this.newPassword});

  ResetPasswordRequestDTO toDTO() {
    return ResetPasswordRequestDTO(email: email, newPassword: newPassword);
  }
}
