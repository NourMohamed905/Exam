import 'package:dio/dio.dart';
import 'package:exam_app/core/constants/api_param.dart';
import 'package:exam_app/core/constants/app_endpoints.dart';
import 'package:exam_app/features/home/home_subject/data/model/subject_response_dto.dart';
import 'package:exam_app/features/profile/data/model/get_user_info_response_dto.dart';
import 'package:exam_app/features/profile/data/model/request/change_pass_request_dto.dart';
import 'package:exam_app/features/profile/data/model/request/update_profile_request_dto.dart';
import 'package:exam_app/features/profile/data/model/update_profile_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
@Injectable()
abstract class ProfileApiService {
  @factoryMethod
  factory ProfileApiService(Dio dio) = _ProfileApiService;

  /// get LoggedUserInfo
  @GET(AppEndPoints.getUserInfo)
  Future<GetUserInfoResponseDto> getUserInfo(
    @Header(ApiParam.token) String token,
  );

  @PUT(AppEndPoints.editProfile)
  Future<UpdateProfileResponseDto> updateProfile(
    @Header(ApiParam.token) String token,
    @Body() UpdateProfileRequestDto request,
  );
  @PATCH(AppEndPoints.changePassword)
  Future<ChangePasswordResponseDTO> changePassword(
    @Header(ApiParam.token) String token,
    @Body() ChangePasswordRequestDTO request,
  );
}
