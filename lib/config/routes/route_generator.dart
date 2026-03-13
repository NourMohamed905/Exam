import 'package:exam_app/core/widgets/place_holder_widget.dart';
import 'package:exam_app/features/auth/login/ui/screen/login_screen.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        // Todo: Replace (Placeholder) With Your Screen .
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.signup:
        return MaterialPageRoute(
          builder: (_) => const PlaceHolderWidget(screenName: 'Signup Screen'),
        );

      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) =>
              const PlaceHolderWidget(screenName: 'Forgot Password Screen'),
        );

      case AppRoutes.verificationCode:
        return MaterialPageRoute(
          builder: (_) =>
              const PlaceHolderWidget(screenName: 'Verification Code Screen'),
        );

      case AppRoutes.resetPassword:
        return MaterialPageRoute(
          builder: (_) =>
              const PlaceHolderWidget(screenName: 'Reset Password Screen'),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const PlaceHolderWidget(screenName: 'Home Screen'),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No route found"))),
        );
    }
  }
}
