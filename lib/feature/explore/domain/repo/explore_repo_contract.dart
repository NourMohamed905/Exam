import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/feature/explore/domain/model/subject_entity.dart';

abstract interface class ExploreRepo {
  Future<BaseResponse<List<SubjectEntity>>> getAllSubjects();
}
