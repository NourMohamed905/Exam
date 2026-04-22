// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_pass_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequestDTO _$ChangePasswordRequestDTOFromJson(
  Map<String, dynamic> json,
) => ChangePasswordRequestDTO(
  oldPassword: json['oldPassword'] as String?,
  password: json['password'] as String?,
  rePassword: json['rePassword'] as String?,
);

Map<String, dynamic> _$ChangePasswordRequestDTOToJson(
  ChangePasswordRequestDTO instance,
) => <String, dynamic>{
  'oldPassword': instance.oldPassword,
  'password': instance.password,
  'rePassword': instance.rePassword,
};
