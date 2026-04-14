import 'package:exam_app/core/models/pagination.dart';
import 'package:exam_app/features/home/home_subject/domain/entity/subject.dart';

class SubjectResponse {
  String? message;
  PaginationInfo? metadata;
  List<Subject>? subjects;

  SubjectResponse({this.message, this.metadata, this.subjects});
}
