import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/error/error_handler.dart';
import 'package:exam_app/features/auth/forget_password/data/data_source/forget_remote_datasource.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/forget_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/reset_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/verify_code_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/forget_pass_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/reset_pass_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/repository/forget_pass_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPassRepoContract)
class ForgetPassRepoImpl implements ForgetPassRepoContract {
  final ForgetRemoteDataSourceContract remoteDataSource;

  ForgetPassRepoImpl({required this.remoteDataSource});

  @override
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest request,
  ) async {
    try {
      final response = await remoteDataSource.forgetPassword(request.toDTO());

      final domainResponse = response.toDomain();

      return SuccessBaseResponse<ForgetPasswordResponse>(data: domainResponse);
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return ErrorBaseResponse<ForgetPasswordResponse>(
        errorMessage: failure.message,
      );
    }
  }

  @override
  Future<BaseResponse<ForgetPasswordResponse>> verifyCode(
    VerifyCodeRequest request,
  ) async {
    try {
      final response = await remoteDataSource.verifyCode(request.toDTO());

      final domainResponse = response.toDomain();

      return SuccessBaseResponse<ForgetPasswordResponse>(data: domainResponse);
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return ErrorBaseResponse<ForgetPasswordResponse>(
        errorMessage: failure.message,
      );
    }
  }

  @override
  Future<BaseResponse<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    try {
      final response = await remoteDataSource.resetPassword(request.toDTO());

      final domainResponse = response.toDomain();

      return SuccessBaseResponse<ResetPasswordResponse>(data: domainResponse);
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return ErrorBaseResponse<ResetPasswordResponse>(
        errorMessage: failure.message,
      );
    }
  }
}
