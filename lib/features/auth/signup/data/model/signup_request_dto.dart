import 'package:json_annotation/json_annotation.dart';

part 'signup_request_dto.g.dart';

@JsonSerializable()
class SignupRequestDTO {
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "rePassword")
  String? rePassword;
  @JsonKey(name: "phone")
  String? phone;

  SignupRequestDTO({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory SignupRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestDTOToJson(this);
}
