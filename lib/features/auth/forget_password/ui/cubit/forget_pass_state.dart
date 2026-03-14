import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/forget_pass_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/reset_pass_response.dart';

class ForgetPasswordState {
  BaseState<ForgetPasswordResponse> forgetPasswordState;
  BaseState<ForgetPasswordResponse> verifyCodeState;
  BaseState<ResetPasswordResponse> resetPasswordState;

  int currentStep;

  ForgetPasswordState({
    BaseState<ForgetPasswordResponse>? forgetPasswordState,
    BaseState<ForgetPasswordResponse>? verifyCodeState,
    BaseState<ResetPasswordResponse>? resetPasswordState,
    this.currentStep = 0,
  }) : forgetPasswordState = forgetPasswordState ?? BaseState(),
       verifyCodeState = verifyCodeState ?? BaseState(),
       resetPasswordState = resetPasswordState ?? BaseState();

  ForgetPasswordState copyWith({
    BaseState<ForgetPasswordResponse>? forgetPasswordStateParam,
    BaseState<ForgetPasswordResponse>? verifyCodeStateParam,
    BaseState<ResetPasswordResponse>? resetPasswordStateParam,
    int? currentStepParam,
  }) {
    return ForgetPasswordState(
      forgetPasswordState: forgetPasswordStateParam ?? forgetPasswordState,
      verifyCodeState: verifyCodeStateParam ?? verifyCodeState,
      resetPasswordState: resetPasswordStateParam ?? resetPasswordState,
      currentStep: currentStepParam ?? currentStep,
    );
  }
}
