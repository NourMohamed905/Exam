// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectResponseDTO _$SubjectResponseDTOFromJson(Map<String, dynamic> json) =>
    SubjectResponseDTO(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : PaginationInfo.fromJson(json['metadata'] as Map<String, dynamic>),
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => SubjectDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectResponseDTOToJson(SubjectResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'subjects': instance.subjects,
    };
