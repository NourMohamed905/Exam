import 'package:json_annotation/json_annotation.dart';

part 'forget_pass_request_dto.g.dart';

@JsonSerializable()
class ForgetPasswordRequestDTO {
  @JsonKey(name: "email")
  String? email;

  ForgetPasswordRequestDTO({this.email});

  factory ForgetPasswordRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestDTOToJson(this);
}
