import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/constants/auth_constants.dart';
import 'package:exam_app/core/widgets/custom_app_bar.dart';
import 'package:exam_app/features/profile/change_password_ui/cubit/change_password_view_model.dart';
import 'package:exam_app/features/profile/change_password_ui/widgets/change_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChangePasswordViewModel(
        getIt(), // use case
      ),
      child: const Scaffold(
        appBar: CustomAppBar(
          title: AuthConstants.changePasswordTitle,
        ),
        body: ChangePasswordForm(),
      ),
    );
  }
}