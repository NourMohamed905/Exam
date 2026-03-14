import 'package:exam_app/api/auth/auth_api.dart';
import 'package:exam_app/features/auth/forget_password/data/data_source/forget_remote_datasource.dart';
import 'package:exam_app/features/auth/forget_password/data/model/request/forget_pass_request_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/request/reset_pass_request_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/request/verify_code_request_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/response/forget_pass_response_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/response/reset_pass_response_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetRemoteDataSourceContract)
class ForgetRemoteDatasourceImpl implements ForgetRemoteDataSourceContract {
  final AuthApi authApi;

  ForgetRemoteDatasourceImpl({required this.authApi});
  @override
  Future<ForgetPasswordResponseDTO> forgetPassword(
    ForgetPasswordRequestDTO request,
  ) async {
    final response = await authApi.forgotPassword(request.toJson());
    return ForgetPasswordResponseDTO.fromJson(response.data);
  }

  @override
  Future<ResetPasswordResponseDTO> resetPassword(
    ResetPasswordRequestDTO request,
  ) async {
    final response = await authApi.resetPassword(request.toJson());
    return ResetPasswordResponseDTO.fromJson(response.data);
  }

  @override
  Future<ForgetPasswordResponseDTO> verifyCode(
    VerifyCodeRequestDTO request,
  ) async {
    final response = await authApi.verifyResetCode(request.toJson());
    return ForgetPasswordResponseDTO.fromJson(response.data);
  }
}
