import 'package:exam_app/features/auth/login/domain/entity/user.dart';

class LoginResponse {
  String? message;
  String? token;
  User? user;

  LoginResponse({this.message, this.token, this.user});
}
