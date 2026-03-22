import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/storage/local_storage.dart';
import 'package:exam_app/features/auth/login/domain/entity/login_request.dart';
import 'package:exam_app/features/auth/login/domain/entity/login_response.dart';
import 'package:exam_app/features/auth/login/domain/usecase/login_use_case.dart';
import 'package:exam_app/features/auth/login/ui/cubit/login_intint.dart';
import 'package:exam_app/features/auth/login/ui/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCase useCase;
  final LocalStorageService storage;

  LoginViewModel(this.useCase, this.storage) : super(const LoginState());

  String email = "";
  String password = "";

  void doIntent(LoginIntent intent) {
    switch (intent) {
      case EmailChanged():
        email = intent.email;
        _validate();
        break;

      case PasswordChanged():
        password = intent.password;
        _validate();
        break;

      case RememberMeChanged():
        emit(state.copyWith(rememberMe: intent.value));
        break;

      case LoginPressed():
        _login();
        break;
    }
  }

  void _validate() {
    final isValid = email.isNotEmpty && password.isNotEmpty;

    emit(state.copyWith(isFormValid: isValid));
  }

  Future<void> _login() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final response = await useCase.call(
      LoginRequest(email: email, password: password),
    );

    switch (response) {
      case SuccessBaseResponse<LoginResponse>():
        final token = response.data.token;

        if (state.rememberMe && token != null && token.isNotEmpty) {
          await storage.saveToken(token);
        } else {
          await storage.clear();
        }

        await storage.saveRememberMe(state.rememberMe);

        emit(state.copyWith(isLoading: false, user: response.data.user));
        break;

      case ErrorBaseResponse<LoginResponse>():
        emit(
          state.copyWith(isLoading: false, errorMessage: response.errorMessage),
        );

        break;
    }
  }
}
