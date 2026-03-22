import 'package:exam_app/core/constants/auth_constants.dart';
import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/forget_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/verify_code_request.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_intint.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_state.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_view_model.dart';
import 'package:exam_app/features/auth/forget_password/ui/widgets/otp_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpStep extends StatelessWidget {
  final ForgetPasswordState state;
  final ForgetPasswordViewModel viewModel;

  const OtpStep({super.key, required this.state, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            AuthConstants.emailVerification,
            style: getBoldStyle(
              color: AppColors.black,
              fontSize: AppSize.s18.sp,
            ),
          ),
          SizedBox(height: AppSize.s8.h),
          Text(
            AuthConstants.pleaseEnterCode,
            style: getRegularStyle(
              color: AppColors.grey,
              fontSize: AppSize.s14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSize.s24.h),
          Pinput(
            length: 6,
            defaultPinTheme: OtpThemes.defaultPinTheme,
            focusedPinTheme: OtpThemes.focusedPinTheme,
            errorPinTheme: OtpThemes.errorPinTheme,
            forceErrorState: state.verifyCodeState.errorMessage != null,
            onCompleted: (pin) => viewModel.doIntent(
              VerifyCodeIntent(VerifyCodeRequest(resetCode: pin)),
            ),
          ),
          if (state.verifyCodeState.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                state.verifyCodeState.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          SizedBox(height: AppSize.s24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AuthConstants.didntReceiveCode,
                style: getRegularStyle(
                  color: AppColors.black,
                  fontSize: AppSize.s15.sp,
                ),
              ),
              TextButton(
                onPressed: () {
                  viewModel.doIntent(
                    SendEmailIntent(
                      ForgetPasswordRequest(email: viewModel.email),
                    ),
                  );
                },
                child: Text(
                  AuthConstants.resend,
                  style: getRegularStyle(
                    color: AppColors.primaryBlue,
                    fontSize: AppSize.s15.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
