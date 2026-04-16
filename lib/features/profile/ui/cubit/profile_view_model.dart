import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/storage/local_storage.dart';
import 'package:exam_app/features/profile/domain/entity/get_user_info_response.dart';
import 'package:exam_app/features/profile/domain/entity/request/update_profile_request.dart';
import 'package:exam_app/features/profile/domain/entity/update_profile_response.dart';
import 'package:exam_app/features/profile/domain/usecase/get_user_info_usecase.dart';
import 'package:exam_app/features/profile/domain/usecase/update_profile_usecase.dart';
import 'package:exam_app/features/profile/ui/cubit/profile_intint.dart';
import 'package:exam_app/features/profile/ui/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  final GetUserInfoUseCase getUserInfoUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileViewModel(this.getUserInfoUseCase, this.updateProfileUseCase)
    : super(ProfileState());

  Future<void> onIntent(ProfileIntent intent) async {
    switch (intent) {
      case LoadProfileIntent():
        await _loadProfile();

      case UpdateProfileIntent():
        await _updateProfile(intent.request);
      case LogoutIntent():
        await _logout();
    }
  }

  Future<void> _loadProfile() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await getUserInfoUseCase.call();

    switch (result) {
      case SuccessBaseResponse<GetUserInfoResponse>():
        emit(state.copyWith(isLoading: false, userData: result.data));

      case ErrorBaseResponse<GetUserInfoResponse>():
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: result.failure.message,
          ),
        );
    }
  }

  Future<void> _updateProfile(UpdateProfileRequest request) async {
    emit(state.copyWith(isUpdating: true, errorMessage: null));

    final result = await updateProfileUseCase.call(request);

    switch (result) {
      case SuccessBaseResponse<UpdateProfileResponse>():
        emit(
          state.copyWith(
            isUpdating: false,
            successMessage: result.data.message,
          ),
        );

        await _loadProfile();

      case ErrorBaseResponse<UpdateProfileResponse>():
        emit(
          state.copyWith(
            isUpdating: false,
            errorMessage: result.failure.message,
          ),
        );
    }
  }

  final localStorageService = LocalStorageService();

  Future<void> _logout() async {
    emit(state.copyWith(isLoading: true));
    await localStorageService.logout();

    emit(state.copyWith(isLoading: false, isLoggedOut: true));
  }
}
