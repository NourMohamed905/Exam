import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/profile/domain/entity/change_pass_response.dart';
import 'package:exam_app/features/profile/domain/entity/get_user_info_response.dart';
import 'package:exam_app/features/profile/domain/entity/request/change_pass_request.dart';
import 'package:exam_app/features/profile/domain/entity/request/update_profile_request.dart';
import 'package:exam_app/features/profile/domain/entity/update_profile_response.dart';

abstract class ProfileRemoteDatasourceContract {
  Future<BaseResponse<GetUserInfoResponse>> getUserInfo(String token);
  Future<BaseResponse<UpdateProfileResponse>> updateProfile(
    String token,
    UpdateProfileRequest request,
  );
  Future<BaseResponse<ChangePasswordResponseEntity>> changePassword(
    String token,
    ChangePasswordRequestEntity request,
  );
}
