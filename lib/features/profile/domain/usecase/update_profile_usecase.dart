import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/profile/domain/entity/request/update_profile_request.dart';
import 'package:exam_app/features/profile/domain/entity/update_profile_response.dart';
import 'package:exam_app/features/profile/domain/repository/profile_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProfileUseCase {
  final ProfileRepoContract _profileRepo;
  UpdateProfileUseCase(this._profileRepo);
  Future<BaseResponse<UpdateProfileResponse>> call(
    UpdateProfileRequest request,
  ) async {
    return await _profileRepo.updateProfile(request);
  }
}
