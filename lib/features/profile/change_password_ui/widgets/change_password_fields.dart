import 'package:exam_app/core/constants/auth_constants.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/app_text_field.dart';
import 'package:exam_app/core/widgets/app_validators.dart';
import 'package:exam_app/features/profile/change_password_ui/cubit/change_password_intent.dart';
import 'package:exam_app/features/profile/change_password_ui/cubit/change_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordFields extends StatefulWidget {
  const ChangePasswordFields({super.key});

  @override
  State<ChangePasswordFields> createState() =>
      _ChangePasswordFieldsState();
}

class _ChangePasswordFieldsState extends State<ChangePasswordFields> {
  bool showOld = false;
  bool showNew = false;
  bool showConfirm = false;

  @override
  Widget build(BuildContext context) {
    final vm = context.read<ChangePasswordViewModel>();

    return Column(
      children: [
        /// OLD PASSWORD
        CustomTextFormField(
          labelText: AuthConstants.currentPassword,
          hintText: AuthConstants.enterCurrentPassword,
          isPassword: !showOld,
          validator: AppValidators.validatePassword,
          onChanged: (v) =>
              vm.doIntent(OldPasswordChanged(v)),
          suffixIcon: IconButton(
            icon: Icon(
              showOld ? Icons.visibility : Icons.visibility_off,
              color: AppColors.grey,
            ),
            onPressed: () {
              setState(() => showOld = !showOld);
            },
          ),
        ),

        SizedBox(height: AppSize.s20.h),

        /// NEW PASSWORD
        CustomTextFormField(
          labelText: AuthConstants.newPassword,
          hintText: AuthConstants.enterNewPassword,
          isPassword: !showNew,
          validator: AppValidators.validatePassword,
          onChanged: (v) =>
              vm.doIntent(NewPasswordChanged(v)),
          suffixIcon: IconButton(
            icon: Icon(
              showNew ? Icons.visibility : Icons.visibility_off,
              color: AppColors.grey,
            ),
            onPressed: () {
              setState(() => showNew = !showNew);
            },
          ),
        ),

        SizedBox(height: AppSize.s20.h),

        /// CONFIRM PASSWORD
        CustomTextFormField(
          labelText: AuthConstants.confirmPassword,
          hintText: AuthConstants.enterConfirmPassword,
          isPassword: !showConfirm,
          validator: (v) => AppValidators.validateConfirmPassword(
            v,
            vm.newPassword,
          ),
          onChanged: (v) =>
              vm.doIntent(ConfirmPasswordChanged(v)),
          suffixIcon: IconButton(
            icon: Icon(
              showConfirm ? Icons.visibility : Icons.visibility_off,
              color: AppColors.grey,
            ),
            onPressed: () {
              setState(() => showConfirm = !showConfirm);
            },
          ),
        ),
      ],
    );
  }
}