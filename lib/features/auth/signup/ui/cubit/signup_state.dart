import 'package:exam_app/features/auth/login/domain/entity/user.dart';

class SignupState {
  final bool isFormValid;
  final bool isLoading;

  final User? user;
  final String? errorMessage;
  final String? successMessage;

  const SignupState({
    this.isFormValid = false,
    this.isLoading = false,
    this.user,
    this.errorMessage,
    this.successMessage,
  });

  SignupState copyWith({
    bool? isFormValid,
    bool? isLoading,
    User? user,
    String? errorMessage,
    String? successMessage,
  }) {
    return SignupState(
      isFormValid: isFormValid ?? this.isFormValid,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}
