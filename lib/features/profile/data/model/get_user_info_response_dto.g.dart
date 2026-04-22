// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_info_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserInfoResponseDto _$GetUserInfoResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetUserInfoResponseDto(
  message: json['message'] as String?,
  user: json['user'] == null
      ? null
      : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetUserInfoResponseDtoToJson(
  GetUserInfoResponseDto instance,
) => <String, dynamic>{'message': instance.message, 'user': instance.user};
