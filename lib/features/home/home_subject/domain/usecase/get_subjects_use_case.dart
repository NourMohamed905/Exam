import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/home/home_subject/domain/entity/subject_response.dart';
import 'package:exam_app/features/home/home_subject/domain/repository/home_subject_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubjectsUseCase {
  final HomeSubjectRepoContract repository;

  GetSubjectsUseCase({required this.repository});

  Future<BaseResponse<SubjectResponse>> call() async {
    return await repository.getAllSubjects();
  }
}
