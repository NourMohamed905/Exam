import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/storage/local_storage.dart';
import 'package:exam_app/features/profile/data/datasource/remote/profile_remote_datasource_contract.dart';
import 'package:exam_app/features/profile/domain/entity/get_user_info_response.dart';
import 'package:exam_app/features/profile/domain/entity/request/update_profile_request.dart';
import 'package:exam_app/features/profile/domain/entity/update_profile_response.dart';
import 'package:exam_app/features/profile/domain/repository/profile_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepoContract)
class ProfileRepoImpl implements ProfileRepoContract {
  final LocalStorageService localStorageService;
  final ProfileRemoteDatasourceContract remoteDataSource;
  ProfileRepoImpl(this.localStorageService, this.remoteDataSource);
  @override
  Future<BaseResponse<GetUserInfoResponse>> getUserInfo() async {
    final token = await localStorageService.getToken();
    final response = await remoteDataSource.getUserInfo(token.toString());
    switch (response) {
      case SuccessBaseResponse<GetUserInfoResponse>():
        return SuccessBaseResponse(data: response.data);
      case ErrorBaseResponse<GetUserInfoResponse>():
        return ErrorBaseResponse(failure: response.failure);
    }
  }

  @override
  Future<BaseResponse<UpdateProfileResponse>> updateProfile(
    UpdateProfileRequest request,
  ) async {
    final token = await localStorageService.getToken();
    final response = await remoteDataSource.updateProfile(
      token.toString(),
      request,
    );
    switch (response) {
      case SuccessBaseResponse<UpdateProfileResponse>():
        return SuccessBaseResponse(data: response.data);
      case ErrorBaseResponse<UpdateProfileResponse>():
        return ErrorBaseResponse(failure: response.failure);
    }
  }
}
