import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/config/routes/app_routes.dart';
import 'package:exam_app/core/constants/auth_constants.dart';
import 'package:exam_app/core/widgets/custom_app_bar.dart';
import 'package:exam_app/features/auth/login/ui/cubit/login_state.dart';
import 'package:exam_app/features/auth/login/ui/cubit/login_view_model.dart';
import 'package:exam_app/features/auth/login/ui/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginViewModel>(),
      child: BlocListener<LoginViewModel, LoginState>(
        listener: (context, state) {
          if (state.user != null) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.home,
              (route) => false,
            );

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text(AuthConstants.loginSuccess),
              ),
            );

            return;
          }

          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage!),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: CustomAppBar(
            title: AuthConstants.login,
            showBackButton: false,
          ),
          body: SingleChildScrollView(child: const LoginForm()),
        ),
      ),
    );
  }
}
