import 'package:exam_app/features/profile/domain/entity/get_user_info_response.dart';

class ProfileState {
  final bool isLoading;
  final bool isUpdating;
  final GetUserInfoResponse? userData;
  final String? errorMessage;
  final String? successMessage;
  final bool isLoggedOut;

  ProfileState({
    this.isLoading = false,
    this.isUpdating = false,
    this.userData,
    this.errorMessage,
    this.successMessage,
    this.isLoggedOut = false,
  });

  ProfileState copyWith({
    bool? isLoading,
    bool? isUpdating,
    GetUserInfoResponse? userData,
    String? errorMessage,
    String? successMessage,
    bool? isLoggedOut,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      isUpdating: isUpdating ?? this.isUpdating,
      userData: userData ?? this.userData,
      errorMessage: errorMessage,
      successMessage: successMessage,
      isLoggedOut: isLoggedOut ?? this.isLoggedOut,
    );
  }
}
