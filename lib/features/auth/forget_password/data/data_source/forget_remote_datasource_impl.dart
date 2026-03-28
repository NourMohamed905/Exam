import 'package:exam_app/api/auth/auth_api.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/data_source_execution.dart';
import 'package:exam_app/features/auth/forget_password/data/data_source/forget_remote_datasource.dart';
import 'package:exam_app/features/auth/forget_password/data/model/request/forget_pass_request_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/request/reset_pass_request_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/request/verify_code_request_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/response/forget_pass_response_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/response/reset_pass_response_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/response/verify_code_response_dto.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/forget_pass_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/reset_pass_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/verify_code_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetRemoteDataSourceContract)
class ForgetRemoteDatasourceImpl implements ForgetRemoteDataSourceContract {
  final AuthApi authApi;
  final DataSourceExecution executor;

  ForgetRemoteDatasourceImpl({required this.authApi, required this.executor});

  @override
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequestDTO request,
  ) {
    return executor.execute<ForgetPasswordResponse>(() async {
      final response = await authApi.forgotPassword(request.toJson());

      final dto = ForgetPasswordResponseDTO.fromJson(response.data);

      return dto.toDomain();
    });
  }

  @override
  Future<BaseResponse<VerifyCodeResponse>> verifyCode(
    VerifyCodeRequestDTO request,
  ) {
    return executor.execute<VerifyCodeResponse>(() async {
      final response = await authApi.verifyResetCode(request.toJson());

      final dto = VerifyCodeResponseDTO.fromJson(response.data);

      return dto.toDomain();
    });
  }

  @override
  Future<BaseResponse<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequestDTO request,
  ) {
    return executor.execute<ResetPasswordResponse>(() async {
      final response = await authApi.resetPassword(request.toJson());

      final dto = ResetPasswordResponseDTO.fromJson(response.data);

      return dto.toDomain();
    });
  }
}
