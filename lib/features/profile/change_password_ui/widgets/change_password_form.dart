import 'package:exam_app/core/constants/auth_constants.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/primary_button.dart';
import 'package:exam_app/features/profile/change_password_ui/cubit/change_password_intent.dart';
import 'package:exam_app/features/profile/change_password_ui/cubit/change_password_state.dart';
import 'package:exam_app/features/profile/change_password_ui/cubit/change_password_view_model.dart';
import 'package:exam_app/features/profile/change_password_ui/widgets/change_password_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final vm = context.read<ChangePasswordViewModel>();

    return BlocConsumer<ChangePasswordViewModel, ChangePasswordState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: AppColors.errorRed,
            ),
          );
        }

        if (state.successMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.successMessage!),
              backgroundColor: AppColors.successGreen,
            ),
          );
           Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(AppPadding.p16.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const ChangePasswordFields(),
                SizedBox(height: AppSize.s50),

                CustomButton(
                  text: AuthConstants.updatePassword,
                  isLoading: state.isLoading,
                  onPressed: state.isFormValid
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            vm.doIntent(ChangePasswordPressed());
                          }
                        }
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}