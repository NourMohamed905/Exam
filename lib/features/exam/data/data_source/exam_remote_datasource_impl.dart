import 'package:exam_app/api/exam/exam_api.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/data_source_execution.dart';
import 'package:exam_app/features/exam/data/data_source/exam_remote_datasource.dart';
import 'package:exam_app/features/exam/domain/entity/exam_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamRemoteDataSource)
class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  final ExamApi examApi;
  final DataSourceExecution executor;

  ExamRemoteDataSourceImpl({required this.examApi, required this.executor});

  //*todo : After
  @override
  Future<BaseResponse<ExamResponseEntity>> getExamsBySubject(
    String token,
    String subjectId,
  ) async {
    var response = await executor.execute<ExamResponseEntity>(() async {
      final dto = await examApi.getExamsBySubject(token, subjectId);
      return dto.toEntity();
    });
    return response;
  }
}