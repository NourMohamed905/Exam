import 'package:exam_app/core/models/pagination.dart';
import 'package:exam_app/features/home/home_subject/data/model/subject_dto.dart';
import 'package:exam_app/features/home/home_subject/domain/entity/subject_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'subject_response_dto.g.dart';

@JsonSerializable()
class SubjectResponseDTO {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "metadata")
  PaginationInfo? metadata;
  @JsonKey(name: "subjects")
  List<SubjectDTO>? subjects;

  SubjectResponseDTO({this.message, this.metadata, this.subjects});

  factory SubjectResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectResponseDTOToJson(this);

  SubjectResponse toEntity() {
    return SubjectResponse(
      message: message,
      metadata: metadata,
      subjects: (subjects ?? [])
          .whereType<SubjectDTO>()
          .map((e) => e.toEntity())
          .toList(),
    );
  }
}
