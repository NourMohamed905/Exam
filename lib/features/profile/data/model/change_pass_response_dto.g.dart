// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_pass_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordResponseDTO _$ChangePasswordResponseDTOFromJson(
  Map<String, dynamic> json,
) => ChangePasswordResponseDTO(
  message: json['message'] as String?,
  token: json['token'] as String?,
);

Map<String, dynamic> _$ChangePasswordResponseDTOToJson(
  ChangePasswordResponseDTO instance,
) => <String, dynamic>{'message': instance.message, 'token': instance.token};
