import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/constants/auth_constants.dart';
import 'package:exam_app/features/profile/change_password_ui/cubit/change_password_intent.dart';
import 'package:exam_app/features/profile/change_password_ui/cubit/change_password_state.dart';
import 'package:exam_app/features/profile/domain/entity/request/change_pass_request.dart';
import 'package:exam_app/features/profile/domain/entity/change_pass_response.dart';
import 'package:exam_app/features/profile/domain/usecase/change_pass_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordViewModel extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase useCase;

  ChangePasswordViewModel(this.useCase)
      : super(const ChangePasswordState());

  String oldPassword = "";
  String newPassword = "";
  String confirmPassword = "";

  void doIntent(ChangePasswordIntent intent) {
    switch (intent) {
      case OldPasswordChanged():
        _onOldPasswordChanged(intent.value);
        break;

      case NewPasswordChanged():
        _onNewPasswordChanged(intent.value);
        break;

      case ConfirmPasswordChanged():
        _onConfirmPasswordChanged(intent.value);
        break;

      case ChangePasswordPressed():
        _changePassword();
        break;
    }
  }

  void _onOldPasswordChanged(String value) {
    oldPassword = value;
    _validate();
  }

  void _onNewPasswordChanged(String value) {
    newPassword = value;
    _validate();
  }

  void _onConfirmPasswordChanged(String value) {
    confirmPassword = value;
    _validate();
  }

  void _validate() {
    final isValid = oldPassword.isNotEmpty &&
        newPassword.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        newPassword == confirmPassword;

    emit(state.copyWith(
      isFormValid: isValid,
      errorMessage: null,
      successMessage: null,
    ));
  }

  Future<void> _changePassword() async {
    if (newPassword != confirmPassword) {
      emit(state.copyWith(
        errorMessage: AuthConstants.passwordNotMatched,
      ));
      return;
    }

    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    ));

    final response = await useCase.call(
      ChangePasswordRequestEntity(
        oldPassword: oldPassword,
        password: newPassword,
        rePassword: confirmPassword,
      ),
    );

    switch (response) {
      case SuccessBaseResponse<ChangePasswordResponseEntity>():
        emit(state.copyWith(
          isLoading: false,
          successMessage: "Password changed successfully",
        ));
        break;

      case ErrorBaseResponse<ChangePasswordResponseEntity>():
        emit(state.copyWith(
          isLoading: false,
          errorMessage: response.failure.message,
        ));
        break;
    }
  }
}