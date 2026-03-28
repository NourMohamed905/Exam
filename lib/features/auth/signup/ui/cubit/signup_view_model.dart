import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/signup/domain/entity/signup_request.dart';
import 'package:exam_app/features/auth/signup/domain/entity/signup_response.dart';
import 'package:exam_app/features/auth/signup/domain/usecase/signup_use_case.dart';
import 'package:exam_app/features/auth/signup/ui/cubit/signup_intent.dart';
import 'package:exam_app/features/auth/signup/ui/cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupViewModel extends Cubit<SignupState> {
  final SignupUseCase useCase;

  SignupViewModel(this.useCase) : super(const SignupState());

  String username = "";
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  String phone = "";

  void doIntent(SignupIntent intent) {
    if (intent is UserNameChanged) {
      username = intent.username;
      _validate();
    } else if (intent is FirstNameChanged) {
      firstName = intent.firstName;
      _validate();
    } else if (intent is LastNameChanged) {
      lastName = intent.lastName;
      _validate();
    } else if (intent is EmailChanged) {
      email = intent.email;
      _validate();
    } else if (intent is PasswordChanged) {
      password = intent.password;
      _validate();
    } else if (intent is ConfirmPasswordChanged) {
      confirmPassword = intent.confirmPassword;
      _validate();
    } else if (intent is PhoneChanged) {
      phone = intent.phone;
      _validate();
    } else if (intent is SignupPressed) {
      _signup();
    }
  }

  void _validate() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    final isValid = username.isNotEmpty &&
        email.isNotEmpty &&
        emailRegex.hasMatch(email) &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        password == confirmPassword &&
        phone.isNotEmpty;

    emit(state.copyWith(isFormValid: isValid));
  }

  Future<void> _signup() async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, successMessage: null),
    );

    final response = await useCase.call(
      SignupRequest(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        rePassword: confirmPassword,
        phone: phone,
      ),
    );

    switch (response) {
      case SuccessBaseResponse<SignupResponse>():
        emit(
          state.copyWith(
            isLoading: false,
            user: response.data.user,
            successMessage: "Account created successfully",
          ),
        );
        break;

      case ErrorBaseResponse<SignupResponse>():
        emit(
          state.copyWith(isLoading: false, errorMessage: response.errorMessage),
        );
        break;
    }
  }
}
