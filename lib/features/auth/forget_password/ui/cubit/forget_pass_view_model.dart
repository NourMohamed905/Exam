import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/forget_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/reset_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/verify_code_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/forget_pass_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/reset_pass_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/verify_code_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/usecase/forget_pass_usecase.dart';
import 'package:exam_app/features/auth/forget_password/domain/usecase/reset_pass_usecase.dart';
import 'package:exam_app/features/auth/forget_password/domain/usecase/verify_code_usecase.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_intint.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final VerifyCodeUseCase _verifyCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  ForgetPasswordViewModel(
    this._forgetPasswordUseCase,
    this._verifyCodeUseCase,
    this._resetPasswordUseCase,
  ) : super(ForgetPasswordState());

  String email = "";

  void doIntent(ForgetPasswordIntent intent) {
    if (intent is SendEmailIntent) {
      _sendEmail(intent.request);
    } else if (intent is VerifyCodeIntent) {
      _verifyCode(intent.request);
    } else if (intent is ResetPasswordIntent) {
      _resetPassword(intent.request);
    }
  }

  Future<void> _sendEmail(ForgetPasswordRequest request) async {
    email = request.email ?? "";

    emit(
      state.copyWith(
        forgetPasswordStateParam: state.forgetPasswordState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
        ),
      ),
    );

    final response = await _forgetPasswordUseCase.call(request);

    if (response is SuccessBaseResponse<ForgetPasswordResponse>) {
      emit(
        state.copyWith(
          currentStepParam: 1,
          forgetPasswordStateParam: state.forgetPasswordState.copyWith(
            isLoadingParam: false,
            dataParam: response.data,
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          forgetPasswordStateParam: state.forgetPasswordState.copyWith(
            isLoadingParam: false,
            errorMessageParam: (response as ErrorBaseResponse).errorMessage,
          ),
        ),
      );
    }
  }

  Future<void> _verifyCode(VerifyCodeRequest request) async {
    emit(
      state.copyWith(
        verifyCodeStateParam: state.verifyCodeState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
        ),
      ),
    );

    final response = await _verifyCodeUseCase.call(request);

    if (response is SuccessBaseResponse<VerifyCodeResponse>) {
      emit(
        state.copyWith(
          currentStepParam: 2,
          verifyCodeStateParam: state.verifyCodeState.copyWith(
            isLoadingParam: false,
            dataParam: response.data,
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          verifyCodeStateParam: state.verifyCodeState.copyWith(
            isLoadingParam: false,
            errorMessageParam: (response as ErrorBaseResponse).errorMessage,
          ),
        ),
      );
    }
  }

  Future<void> _resetPassword(ResetPasswordRequest request) async {
    emit(
      state.copyWith(
        resetPasswordStateParam: state.resetPasswordState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
        ),
      ),
    );

    final response = await _resetPasswordUseCase.call(
      ResetPasswordRequest(
        email: request.email,
        newPassword: request.newPassword,
      ),
    );

    if (response is SuccessBaseResponse<ResetPasswordResponse>) {
      emit(
        state.copyWith(
          currentStepParam: 3,
          resetPasswordStateParam: state.resetPasswordState.copyWith(
            isLoadingParam: false,
            dataParam: response.data,
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          resetPasswordStateParam: state.resetPasswordState.copyWith(
            isLoadingParam: false,
            errorMessageParam: (response as ErrorBaseResponse).errorMessage,
          ),
        ),
      );
    }
  }
}
