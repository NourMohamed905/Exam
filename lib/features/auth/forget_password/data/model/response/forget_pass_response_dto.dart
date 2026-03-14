import 'package:exam_app/features/auth/forget_password/domain/entity/response/forget_pass_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'forget_pass_response_dto.g.dart';

@JsonSerializable()
class ForgetPasswordResponseDTO {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "info")
  String? info;

  ForgetPasswordResponseDTO({this.message, this.info});

  factory ForgetPasswordResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseDTOToJson(this);

  ForgetPasswordResponse toDomain() {
    return ForgetPasswordResponse(message: message, info: info);
  }
}
