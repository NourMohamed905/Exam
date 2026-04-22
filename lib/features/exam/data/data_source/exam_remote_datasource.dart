import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam/domain/entity/exam_response.dart';

abstract class ExamRemoteDataSource {
  Future<BaseResponse<ExamResponseEntity>> getExamsBySubject(
    String token,
    String subjectId,
  ); // Assuming you need to pass a token and subject ID to fetch exams by subject
}