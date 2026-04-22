import 'package:exam_app/features/profile/domain/entity/update_user.dart';

class UpdateProfileResponse {
  String? message;
  UpdateUser? user;

  UpdateProfileResponse({this.message, this.user});
}
