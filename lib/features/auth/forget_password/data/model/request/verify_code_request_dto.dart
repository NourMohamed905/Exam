import 'package:json_annotation/json_annotation.dart';
part 'verify_code_request_dto.g.dart';

@JsonSerializable()
class VerifyCodeRequestDTO {
  @JsonKey(name: "resetCode")
  String? resetCode;

  VerifyCodeRequestDTO({this.resetCode});

  factory VerifyCodeRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeRequestDTOToJson(this);
}
