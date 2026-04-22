import 'package:exam_app/features/profile/data/model/update_user_dto.dart';
import 'package:exam_app/features/profile/domain/entity/update_profile_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'update_profile_response_dto.g.dart';

@JsonSerializable()
class UpdateProfileResponseDto {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "user")
  UpdateUserDTO? user;

  UpdateProfileResponseDto({this.message, this.user});

  factory UpdateProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileResponseDtoToJson(this);

  UpdateProfileResponse toEntity() {
    return UpdateProfileResponse(message: message, user: user?.toDomain());
  }
}
