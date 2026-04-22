import 'package:exam_app/core/models/pagination.dart';
import 'package:exam_app/features/exam/data/model/exam_dto.dart';
import 'package:exam_app/features/exam/domain/entity/exam_response.dart';
import 'package:exam_app/features/exam/domain/entity/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_response_dto.g.dart';


@JsonSerializable()
class ExamResponseDto {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "metadata")
  PaginationInfo? metadata;
  @JsonKey(name: "exams")
  List<ExamDTO>? exams;

  ExamResponseDto({this.message, this.metadata, this.exams});

  factory ExamResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ExamResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResponseDtoToJson(this);

  ExamResponseEntity toEntity() {
    return ExamResponseEntity(
      message: message,
      metadata: metadata != null
          ? Metadata(
              currentPage: metadata!.currentPage,
              numberOfPages: metadata!.numberOfPages,
              limit: metadata!.limit,
            )
          : null,
      exams: exams?.map((examDto) => examDto.toEntity()).toList(),
    );
  }
}