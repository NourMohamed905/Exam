import 'package:exam_app/core/models/user_dto.dart';
import 'package:exam_app/features/profile/domain/entity/get_user_info_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_info_response_dto.g.dart';

@JsonSerializable()
class GetUserInfoResponseDto {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "user")
  UserDTO? user;

  GetUserInfoResponseDto({this.message, this.user});

  factory GetUserInfoResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserInfoResponseDtoToJson(this);

  GetUserInfoResponse toEntity() {
    return GetUserInfoResponse(message: message, user: user?.toDomain());
  }
}
