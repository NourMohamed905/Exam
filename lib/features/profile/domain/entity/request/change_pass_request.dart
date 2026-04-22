import 'package:exam_app/features/profile/data/model/request/change_pass_request_dto.dart';

class ChangePasswordRequestEntity {
  String? oldPassword;
  String? password;
  String? rePassword;

  ChangePasswordRequestEntity({
    this.oldPassword,
    this.password,
    this.rePassword,
  });
  ChangePasswordRequestDTO toDto() {
    return ChangePasswordRequestDTO(
      oldPassword: oldPassword,
      password: password,
      rePassword: rePassword,
    );
  }
}
