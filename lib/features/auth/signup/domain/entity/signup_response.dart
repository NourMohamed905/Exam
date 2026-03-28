import 'package:exam_app/features/auth/login/domain/entity/user.dart';

class SignupResponse {
  String? message;
  String? token;
  User? user;

  SignupResponse({this.message, this.token, this.user});
}
