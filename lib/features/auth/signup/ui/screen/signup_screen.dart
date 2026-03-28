import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/constants/app_constants.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/custom_app_bar.dart';
import 'package:exam_app/features/auth/signup/ui/cubit/signup_state.dart';
import 'package:exam_app/features/auth/signup/ui/cubit/signup_view_model.dart';
import 'package:exam_app/features/auth/signup/ui/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignupViewModel>(),
      child: BlocListener<SignupViewModel, SignupState>(
        listener: (context, state) {
          if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(state.successMessage!),
              ),
            );
            // Optionally navigate to login or home
            Navigator.pop(context);
          }

          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.errorRed,
                content: Text(state.errorMessage!),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: CustomAppBar(
            title: AppConstants.signUp,
          ),
          body: const SignupForm(),
        ),
      ),
    );
  }
}
