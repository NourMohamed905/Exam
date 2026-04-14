import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/home/home_subject/domain/entity/subject_response.dart';

abstract class HomeSubjectRepoContract {
  Future<BaseResponse<SubjectResponse>> getAllSubjects();
}
