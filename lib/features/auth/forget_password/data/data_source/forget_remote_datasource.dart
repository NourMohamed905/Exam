import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/data/model/request/forget_pass_request_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/request/reset_pass_request_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/request/verify_code_request_dto.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/forget_pass_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/reset_pass_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/verify_code_response.dart';

abstract class ForgetRemoteDataSourceContract {
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequestDTO request,
  );

  Future<BaseResponse<VerifyCodeResponse>> verifyCode(
    VerifyCodeRequestDTO request,
  );

  Future<BaseResponse<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequestDTO request,
  );
}
