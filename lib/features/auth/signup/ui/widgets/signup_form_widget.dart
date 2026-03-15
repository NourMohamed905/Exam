import 'package:exam_app/core/constants/app_constants.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/app_text_field.dart';
import 'package:exam_app/core/widgets/primary_button.dart';
import 'package:exam_app/features/auth/signup/ui/cubit/signup_intent.dart';
import 'package:exam_app/features/auth/signup/ui/cubit/signup_state.dart';
import 'package:exam_app/features/auth/signup/ui/cubit/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignupViewModel>();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              hintText: AppConstants.enterYourUsername,
              labelText: AppConstants.username,
              onChanged: (value) => viewModel.doIntent(UserNameChanged(value)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppConstants.fieldRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: AppConstants.enterFirstName,
                    labelText: AppConstants.firstName,
                    onChanged: (value) =>
                        viewModel.doIntent(FirstNameChanged(value)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    hintText: AppConstants.enterLastName,
                    labelText: AppConstants.lastName,
                    onChanged: (value) =>
                        viewModel.doIntent(LastNameChanged(value)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: AppConstants.enterYourEmail,
              labelText: AppConstants.email,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => viewModel.doIntent(EmailChanged(value)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppConstants.fieldRequired;
                }
                const emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                if (!RegExp(emailPattern).hasMatch(value)) {
                  return AppConstants.emailIsNotValid;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: AppConstants.enterPassword,
                    labelText: AppConstants.password,
                    isPassword: true,
                    onChanged: (value) =>
                        viewModel.doIntent(PasswordChanged(value)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppConstants.fieldRequired;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    hintText: AppConstants.confirmPassword,
                    labelText: AppConstants.confirmPassword,
                    isPassword: true,
                    onChanged: (value) =>
                        viewModel.doIntent(ConfirmPasswordChanged(value)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppConstants.fieldRequired;
                      }
                      if (value != viewModel.password) {
                        return AppConstants.passwordNotMatched;
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: AppConstants.enterPhoneNumber,
              labelText: AppConstants.phoneNumber,
              keyboardType: TextInputType.phone,
              onChanged: (value) => viewModel.doIntent(PhoneChanged(value)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppConstants.fieldRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<SignupViewModel, SignupState>(
              buildWhen: (previous, current) =>
                  previous.isLoading != current.isLoading ||
                  previous.isFormValid != current.isFormValid,
              builder: (context, state) {
                return CustomButton(
                  text: AppConstants.signUp,
                  isLoading: state.isLoading,
                  onPressed: state.isFormValid
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            viewModel.doIntent(SignupPressed());
                          }
                        }
                      : null,
                );
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(AppConstants.haveAnAccount),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    AppConstants.login,
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
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
