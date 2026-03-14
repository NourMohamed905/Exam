import 'package:exam_app/features/auth/forget_password/domain/entity/response/reset_pass_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reset_pass_response_dto.g.dart';

@JsonSerializable()
class ResetPasswordResponseDTO {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;

  ResetPasswordResponseDTO({this.message, this.token});

  factory ResetPasswordResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseDTOToJson(this);

  ResetPasswordResponse toDomain() {
    return ResetPasswordResponse(message: message, token: token);
  }
}
