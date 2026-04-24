class ChangePasswordState {
  final bool isFormValid;
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;

  const ChangePasswordState({
    this.isFormValid = false,
    this.isLoading = false,
    this.errorMessage,
    this.successMessage,
  });

  ChangePasswordState copyWith({
    bool? isFormValid,
    bool? isLoading,
    String? errorMessage,
    String? successMessage,
  }) {
    return ChangePasswordState(
      isFormValid: isFormValid ?? this.isFormValid,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}