import 'package:exam_app/features/auth/login/domain/entity/user.dart';

class GetUserInfoResponse {
  String? message;
  User? user;

  GetUserInfoResponse({this.message, this.user});
}
