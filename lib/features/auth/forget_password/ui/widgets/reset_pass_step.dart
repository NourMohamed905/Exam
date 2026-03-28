import 'package:exam_app/core/constants/auth_constants.dart';
import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/app_text_field.dart';
import 'package:exam_app/core/widgets/app_validators.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/reset_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_intint.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_state.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordStep extends StatefulWidget {
  final ForgetPasswordState state;
  final ForgetPasswordViewModel viewModel;
  final TextEditingController controller;
  final TextEditingController confirmController;

  const ResetPasswordStep({
    super.key,
    required this.state,
    required this.viewModel,
    required this.controller,
    required this.confirmController,
  });

  @override
  State<ResetPasswordStep> createState() => _ResetPasswordStepState();
}

class _ResetPasswordStepState extends State<ResetPasswordStep> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AuthConstants.forgetPassword,
              style: getBoldStyle(
                color: AppColors.black,
                fontSize: AppSize.s18.sp,
              ),
            ),
            SizedBox(height: AppSize.s8.h),
            Text(
              AuthConstants.passwordRequirement,
              textAlign: TextAlign.center,
              style: getRegularStyle(
                color: AppColors.grey,
                fontSize: AppSize.s14.sp,
              ),
            ),
            SizedBox(height: AppSize.s24.h),

            /// New Password
            CustomTextFormField(
              controller: widget.controller,
              labelText: AuthConstants.newPassword,
              hintText: AuthConstants.enterYourPassword,
              isPassword: !_isPasswordVisible,
              validator: AppValidators.validatePassword,
              onChanged: (_) {},
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

            SizedBox(height: AppSize.s16.h),

            /// Confirm Password
            CustomTextFormField(
              controller: widget.confirmController,
              labelText: AuthConstants.confirmPassword,
              hintText: AuthConstants.confirmPassword,
              isPassword: !_isConfirmPasswordVisible,
              validator: (val) => AppValidators.validateConfirmPassword(
                val,
                widget.controller.text,
              ),
              onChanged: (_) {},
              suffixIcon: IconButton(
                icon: Icon(
                  _isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
              ),
            ),

            SizedBox(height: AppSize.s24.h),

            ElevatedButton(
              onPressed: widget.state.resetPasswordState.isLoading
                  ? null
                  : () {
                      if (_formKey.currentState!.validate()) {
                        widget.viewModel.doIntent(
                          ResetPasswordIntent(
                            ResetPasswordRequest(
                              email: widget.viewModel.email,
                              newPassword: widget.controller.text,
                            ),
                          ),
                        );
                      }
                    },
              child: widget.state.resetPasswordState.isLoading
                  ? const CircularProgressIndicator()
                  : const Text(AuthConstants.continueText),
            ),
          ],
        ),
      ),
    );
  }
}
