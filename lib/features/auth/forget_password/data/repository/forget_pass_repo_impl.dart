import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/data/data_source/forget_remote_datasource.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/forget_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/reset_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/verify_code_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/forget_pass_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/reset_pass_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/verify_code_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/repository/forget_pass_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPassRepoContract)
class ForgetRepoImpl implements ForgetPassRepoContract {
  final ForgetRemoteDataSourceContract remoteDataSource;

  ForgetRepoImpl({required this.remoteDataSource});

  @override
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest request,
  ) {
    return remoteDataSource.forgetPassword(request.toDTO());
  }

  @override
  Future<BaseResponse<VerifyCodeResponse>> verifyCode(
    VerifyCodeRequest request,
  ) {
    return remoteDataSource.verifyCode(request.toDTO());
  }

  @override
  Future<BaseResponse<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest request,
  ) {
    return remoteDataSource.resetPassword(request.toDTO());
  }
}
