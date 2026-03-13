import 'package:exam_app/core/models/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_response_dto.g.dart';

@JsonSerializable()
class AuthResponseDTO {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserDTO? user;

  AuthResponseDTO({this.message, this.token, this.user});

  factory AuthResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseDTOToJson(this);
}
