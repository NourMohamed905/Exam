import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam/domain/entity/exam_response.dart';
import 'package:exam_app/features/exam/domain/repository/exam_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExamDetailsUseCase {
  final ExamRepoContract repo;

  GetExamDetailsUseCase({required this.repo});
  Future<BaseResponse<ExamResponseEntity>> call(String id) {
    return repo.getExamById(id);
  }
}