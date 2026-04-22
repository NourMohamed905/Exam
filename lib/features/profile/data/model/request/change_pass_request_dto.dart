import 'package:exam_app/features/profile/domain/entity/request/change_pass_request.dart';
import 'package:json_annotation/json_annotation.dart';
part 'change_pass_request_dto.g.dart';

@JsonSerializable()
class ChangePasswordRequestDTO {
  @JsonKey(name: "oldPassword")
  String? oldPassword;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "rePassword")
  String? rePassword;

  ChangePasswordRequestDTO({this.oldPassword, this.password, this.rePassword});

  factory ChangePasswordRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestDTOToJson(this);
  ChangePasswordRequestEntity toEntity() {
    return ChangePasswordRequestEntity(
      oldPassword: oldPassword,
      password: password,
      rePassword: rePassword,
    );
  }
}
