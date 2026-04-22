import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/profile/domain/entity/change_pass_response.dart';
import 'package:exam_app/features/profile/domain/entity/request/change_pass_request.dart';
import 'package:exam_app/features/profile/domain/repository/profile_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  final ProfileRepoContract _profileRepo;

  ChangePasswordUseCase(this._profileRepo);
  Future<BaseResponse<ChangePasswordResponseEntity>> call(
    ChangePasswordRequestEntity request,
  ) async {
    return await _profileRepo.changePassword(request);
  }
}
