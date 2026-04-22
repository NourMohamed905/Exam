import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/data_source_execution.dart';
import 'package:exam_app/features/profile/api/profile_api.dart';
import 'package:exam_app/features/profile/data/datasource/remote/profile_remote_datasource_contract.dart';
import 'package:exam_app/features/profile/domain/entity/change_pass_response.dart';
import 'package:exam_app/features/profile/domain/entity/get_user_info_response.dart';
import 'package:exam_app/features/profile/domain/entity/request/change_pass_request.dart';
import 'package:exam_app/features/profile/domain/entity/request/update_profile_request.dart';
import 'package:exam_app/features/profile/domain/entity/update_profile_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRemoteDatasourceContract)
class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasourceContract {
  final ProfileApiService apiService;
  final DataSourceExecution executor;
  ProfileRemoteDatasourceImpl(this.apiService, this.executor);
  @override
  Future<BaseResponse<GetUserInfoResponse>> getUserInfo(String token) async {
    var response = await executor.execute<GetUserInfoResponse>(() async {
      final dto = await apiService.getUserInfo(token);
      return dto.toEntity();
    });
    return response;
  }

  @override
  Future<BaseResponse<UpdateProfileResponse>> updateProfile(
    String token,
    UpdateProfileRequest request,
  ) {
    var response = executor.execute(() async {
      final dto = await apiService.updateProfile(token, request.toDTO());
      return dto.toEntity();
    });
    return response;
  }

  @override
  Future<BaseResponse<ChangePasswordResponseEntity>> changePassword(
    String token,
    ChangePasswordRequestEntity request,
  ) async {
    var response = await executor.execute(() async {
      final dto = await apiService.changePassword(token, request.toDto());
      return dto.toEntity();
    });
    return response;
  }
}
