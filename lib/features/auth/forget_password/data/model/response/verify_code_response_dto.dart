import 'package:exam_app/features/auth/forget_password/domain/entity/response/verify_code_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'verify_code_response_dto.g.dart';

@JsonSerializable()
class VerifyCodeResponseDTO {
  @JsonKey(name: "status")
  String? status;

  VerifyCodeResponseDTO({this.status});

  factory VerifyCodeResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeResponseDTOToJson(this);

  VerifyCodeResponse toDomain() {
    return VerifyCodeResponse(status: status);
  }
}
