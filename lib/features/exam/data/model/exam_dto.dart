import 'package:exam_app/features/exam/domain/entity/exam.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exam_dto.g.dart';

@JsonSerializable()
class ExamDTO {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "duration")
  int? duration;
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "numberOfQuestions")
  int? numberOfQuestions;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  ExamDTO({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamDTO.fromJson(Map<String, dynamic> json) =>
      _$ExamDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDTOToJson(this);

  //* data source need to return dto and then we convert it to entity in the repo layer
  ExamEntity toEntity() {
    return ExamEntity(
      id: id,
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
      active: active,
      createdAt: createdAt,
    );
  }
}