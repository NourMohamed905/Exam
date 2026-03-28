import 'package:exam_app/core/constants/app_constants.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/app_text_field.dart';
import 'package:exam_app/core/widgets/app_validators.dart';
import 'package:exam_app/features/auth/login/ui/cubit/login_intint.dart';
import 'package:exam_app/features/auth/login/ui/cubit/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextFields extends StatefulWidget {
  const LoginTextFields({super.key});

  @override
  State<LoginTextFields> createState() => _LoginTextFieldsState();
}

class _LoginTextFieldsState extends State<LoginTextFields> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final vm = context.read<LoginViewModel>();

    return Column(
      children: [
        /// email
        CustomTextFormField(
          labelText: AppConstants.email,
          hintText: AppConstants.enterYourEmail,
          validator: AppValidators.validateEmail,
          onChanged: (value) {
            vm.doIntent(EmailChanged(value));
          },
        ),

        SizedBox(height: 20.h),

        /// password
        CustomTextFormField(
          labelText: AppConstants.password,
          hintText: AppConstants.enterYourPassword,
          validator: AppValidators.validatePassword,
          isPassword: !_isPasswordVisible,
          onChanged: (value) {
            vm.doIntent(PasswordChanged(value));
          },
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.grey,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
      ],
    );
  }
}
