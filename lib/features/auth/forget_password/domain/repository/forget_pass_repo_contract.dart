import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/forget_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/reset_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/verify_code_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/forget_pass_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/reset_pass_response.dart';

abstract class ForgetPassRepoContract {
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest request,
  );
  Future<BaseResponse<ForgetPasswordResponse>> verifyCode(
    VerifyCodeRequest request,
  );
  Future<BaseResponse<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest request,
  );
}
