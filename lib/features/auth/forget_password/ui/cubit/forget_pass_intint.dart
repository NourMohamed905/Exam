import 'package:exam_app/features/auth/forget_password/domain/entity/request/forget_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/reset_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/verify_code_request.dart';

abstract class ForgetPasswordIntent {}

class SendEmailIntent extends ForgetPasswordIntent {
  final ForgetPasswordRequest request;
  SendEmailIntent(this.request);
}

class VerifyCodeIntent extends ForgetPasswordIntent {
  final VerifyCodeRequest request;
  VerifyCodeIntent(this.request);
}

class ResetPasswordIntent extends ForgetPasswordIntent {
  final ResetPasswordRequest request;
  ResetPasswordIntent(this.request);
}
