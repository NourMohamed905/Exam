import 'package:exam_app/features/exam/domain/entity/exam.dart';
import 'package:exam_app/features/exam/domain/entity/meta.dart';

class ExamResponseEntity {
  String? message;
  Metadata? metadata;
  List<ExamEntity>? exams;

  ExamResponseEntity({this.message, this.metadata, this.exams});
}