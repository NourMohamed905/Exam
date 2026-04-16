import 'package:exam_app/features/profile/domain/entity/request/update_profile_request.dart';

sealed class ProfileIntent {}

class LoadProfileIntent extends ProfileIntent {}

class UpdateProfileIntent extends ProfileIntent {
  final UpdateProfileRequest request;
  UpdateProfileIntent(this.request);
}

class LogoutIntent extends ProfileIntent {}
