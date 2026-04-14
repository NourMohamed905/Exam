import 'package:exam_app/features/auth/forget_password/ui/screen/forget_pass_screen.dart';
import 'package:exam_app/features/auth/login/ui/screen/login_screen.dart';
import 'package:exam_app/features/home/home_subject/ui/screen/home_screen.dart';
import 'package:exam_app/features/auth/signup/ui/screen/signup_screen.dart';
import 'package:exam_app/features/home/main_layout/cubit/layout_cubit.dart';
import 'package:exam_app/features/home/main_layout/screen/layout_screen.dart';
import 'package:exam_app/features/splash_screen/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        // Todo: Replace (Placeholder) With Your Screen .
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      case AppRoutes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.mainLayout:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => MainLayoutCubit(),
            child: const MainLayout(),
          ),
        );
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeView());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No route found"))),
        );
    }
  }
}
