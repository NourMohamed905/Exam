import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/profile/domain/entity/get_user_info_response.dart';
import 'package:exam_app/features/profile/domain/repository/profile_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserInfoUseCase {
  final ProfileRepoContract _profileRepo;
  GetUserInfoUseCase(this._profileRepo);

  Future<BaseResponse<GetUserInfoResponse>> call() async {
    return await _profileRepo.getUserInfo();
  }
}
