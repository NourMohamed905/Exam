import 'package:exam_app/config/routes/app_routes.dart';
import 'package:exam_app/core/constants/auth_constants.dart';
import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/primary_button.dart';
import 'package:exam_app/features/auth/login/ui/cubit/login_intint.dart';
import 'package:exam_app/features/auth/login/ui/cubit/login_state.dart';
import 'package:exam_app/features/auth/login/ui/cubit/login_view_model.dart';
import 'package:exam_app/features/auth/login/ui/widgets/login_text_fields_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final vm = context.read<LoginViewModel>();

    return Padding(
      padding: const EdgeInsets.only(
        top: AppPadding.p24,
        right: AppPadding.p16,
        left: AppPadding.p16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            /// text fields
            const LoginTextFields(),

            SizedBox(height: 10.h),

            /// remember me
            BlocBuilder<LoginViewModel, LoginState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: state.rememberMe,
                          onChanged: (value) {
                            vm.doIntent(RememberMeChanged(value!));
                          },
                        ),

                        Text(
                          AuthConstants.rememberMe,
                          style: getMediumStyle(
                            color: AppColors.black,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.forgotPassword);
                      },
                      child: Text(
                        AuthConstants.forgotPassword,
                        style: getTextWithLine(),
                      ),
                    ),
                  ],
                );
              },
            ),

            SizedBox(height: 40.h),

            /// login button
            BlocBuilder<LoginViewModel, LoginState>(
              builder: (context, state) {
                return CustomButton(
                  text: AuthConstants.login,
                  isLoading: state.isLoading,
                  onPressed: state.isFormValid
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            vm.doIntent(LoginPressed());
                          }
                        }
                      : null,
                );
              },
            ),

            SizedBox(height: 16.h),

            /// sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AuthConstants.dontHaveAnAccount,
                  style: getRegularStyle(color: AppColors.black, fontSize: 14),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signup);
                  },
                  child: Text(
                    AuthConstants.signUp,
                    style: getBoldStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
