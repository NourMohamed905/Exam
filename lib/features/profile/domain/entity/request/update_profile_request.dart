import 'package:exam_app/features/profile/data/model/request/update_profile_request_dto.dart';

class UpdateProfileRequest {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  UpdateProfileRequest({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  UpdateProfileRequestDto toDTO() {
    return UpdateProfileRequestDto(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );
  }
}
