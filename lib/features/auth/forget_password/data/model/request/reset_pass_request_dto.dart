import 'package:json_annotation/json_annotation.dart';
part 'reset_pass_request_dto.g.dart';

@JsonSerializable()
class ResetPasswordRequestDTO {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "newPassword")
  String? newPassword;

  ResetPasswordRequestDTO({this.email, this.newPassword});

  factory ResetPasswordRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestDTOToJson(this);
}
