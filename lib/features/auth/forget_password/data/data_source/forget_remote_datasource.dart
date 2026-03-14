import 'package:exam_app/features/auth/forget_password/data/model/request/forget_pass_request_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/request/reset_pass_request_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/request/verify_code_request_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/response/forget_pass_response_dto.dart';
import 'package:exam_app/features/auth/forget_password/data/model/response/reset_pass_response_dto.dart';

abstract class ForgetRemoteDataSourceContract {
  Future<ForgetPasswordResponseDTO> forgetPassword(
    ForgetPasswordRequestDTO request,
  );
  Future<ForgetPasswordResponseDTO> verifyCode(VerifyCodeRequestDTO request);
  Future<ResetPasswordResponseDTO> resetPassword(
    ResetPasswordRequestDTO request,
  );
}
