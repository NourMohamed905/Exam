import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/storage/local_storage.dart';
import 'package:exam_app/features/exam/data/data_source/exam_remote_datasource.dart';
import 'package:exam_app/features/exam/domain/entity/exam_response.dart';
import 'package:exam_app/features/exam/domain/repository/exam_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamRepoContract)
class ExamRepoImpl implements ExamRepoContract {
  final ExamRemoteDataSource remoteDataSource;
  final LocalStorageService
  localStorageService; 

  ExamRepoImpl({
    required this.remoteDataSource,
    required this.localStorageService,
  });

  @override
  Future<BaseResponse<ExamResponseEntity>> getExamById(String id) async {
    final token = await localStorageService
        .getToken(); // get token from local storage
    var response = await remoteDataSource.getExamsBySubject(
      token.toString(),
      id,
    );
    switch (response) {
      case SuccessBaseResponse<ExamResponseEntity>():
        return SuccessBaseResponse<ExamResponseEntity>(data: response.data);
      case ErrorBaseResponse<ExamResponseEntity>():
        return ErrorBaseResponse<ExamResponseEntity>(failure: response.failure);
      }
  }
}