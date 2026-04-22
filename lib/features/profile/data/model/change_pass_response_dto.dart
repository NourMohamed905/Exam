import 'package:exam_app/features/profile/domain/entity/change_pass_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'change_pass_response_dto.g.dart';

@JsonSerializable()
class ChangePasswordResponseDTO {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;

  ChangePasswordResponseDTO({this.message, this.token});

  factory ChangePasswordResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordResponseDTOToJson(this);

  ChangePasswordResponseEntity toEntity() {
    return ChangePasswordResponseEntity(message: message, token: token);
  }
}
