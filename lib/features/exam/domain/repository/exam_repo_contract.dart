import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam/domain/entity/exam_response.dart';

abstract class ExamRepoContract {
  Future<BaseResponse<ExamResponseEntity>> getExamById(String id);
}