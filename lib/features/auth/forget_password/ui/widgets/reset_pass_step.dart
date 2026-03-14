import 'package:exam_app/core/constants/app_constants.dart';
import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/app_text_field.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/reset_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_intint.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_state.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordStep extends StatelessWidget {
  final ForgetPasswordState state;
  final ForgetPasswordViewModel viewModel;
  final TextEditingController controller;

  const ResetPasswordStep({
    super.key,
    required this.state,
    required this.viewModel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppConstants.forgetPassword,
            style: getBoldStyle(
              color: AppColors.black,
              fontSize: AppSize.s18.sp,
            ),
          ),
          SizedBox(height: AppSize.s8.h),
          Text(
            AppConstants.passwordRequirement6Chars,
            textAlign: TextAlign.center,
            style: getRegularStyle(
              color: AppColors.grey,
              fontSize: AppSize.s14.sp,
            ),
          ),
          SizedBox(height: AppSize.s24.h),
          CustomTextFormField(
            controller: controller,
            hintText: AppConstants.enterYourPassword,
            labelText: AppConstants.newPassword,
          ),
          SizedBox(height: AppSize.s42.h),
          ElevatedButton(
            onPressed: state.resetPasswordState.isLoading
                ? null
                : () {
                    viewModel.doIntent(
                      ResetPasswordIntent(
                        ResetPasswordRequest(newPassword: controller.text),
                      ),
                    );
                  },
            child: state.resetPasswordState.isLoading
                ? const CircularProgressIndicator()
                : const Text(AppConstants.continueText),
          ),
        ],
      ),
    );
  }
}
