import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/data_source_execution.dart';
import 'package:exam_app/features/home/home_subject/api/home_subject_api.dart';
import 'package:exam_app/features/home/home_subject/data/datasource/remote/home_subject_remote_contract.dart';
import 'package:exam_app/features/home/home_subject/domain/entity/subject_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeSubjectRemoteContract)
class HomeSubjectRemoteImpl implements HomeSubjectRemoteContract {
  final HomeSubjectApiService apiService;
  final DataSourceExecution executor;

  HomeSubjectRemoteImpl(this.apiService, this.executor);

  @override
  Future<BaseResponse<SubjectResponse>> getAllSubjects(String token) async {
    var response = await executor.execute<SubjectResponse>(() async {
      final dto = await apiService.getAllSubjects(token);
      return dto.toEntity();
    });
    return response;
  }
}
