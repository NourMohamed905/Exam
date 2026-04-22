// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileResponseDto _$UpdateProfileResponseDtoFromJson(
  Map<String, dynamic> json,
) => UpdateProfileResponseDto(
  message: json['message'] as String?,
  user: json['user'] == null
      ? null
      : UpdateUserDTO.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateProfileResponseDtoToJson(
  UpdateProfileResponseDto instance,
) => <String, dynamic>{'message': instance.message, 'user': instance.user};
