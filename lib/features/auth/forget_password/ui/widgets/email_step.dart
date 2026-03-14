import 'package:exam_app/core/constants/app_constants.dart';
import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/forget_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_intint.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_state.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailStep extends StatelessWidget {
  final ForgetPasswordState state;
  final ForgetPasswordViewModel viewModel;
  final TextEditingController controller;

  const EmailStep({
    super.key,
    required this.state,
    required this.viewModel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
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
            AppConstants.pleaseEnterYourEmail,
            style: getRegularStyle(
              color: AppColors.grey,
              fontSize: AppSize.s14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSize.s24.h),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: AppConstants.email,
              hintText: AppConstants.enterYourEmail,
              errorText: state.forgetPasswordState.errorMessage,
            ),
          ),
          SizedBox(height: AppSize.s42.h),
          ElevatedButton(
            onPressed: state.forgetPasswordState.isLoading
                ? null
                : () => viewModel.doIntent(
                    SendEmailIntent(
                      ForgetPasswordRequest(email: controller.text),
                    ),
                  ),
            child: state.forgetPasswordState.isLoading
                ? SizedBox(
                    height: AppSize.s20.h,
                    width: AppSize.s20.w,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(AppConstants.continueText),
          ),
        ],
      ),
    );
  }
}
