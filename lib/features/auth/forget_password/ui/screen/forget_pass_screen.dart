import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/config/routes/app_routes.dart';
import 'package:exam_app/core/constants/app_constants.dart';
import 'package:exam_app/core/widgets/custom_app_bar.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_state.dart';
import 'package:exam_app/features/auth/forget_password/ui/cubit/forget_pass_view_model.dart';
import 'package:exam_app/features/auth/forget_password/ui/widgets/email_step.dart';
import 'package:exam_app/features/auth/forget_password/ui/widgets/otp_step.dart';
import 'package:exam_app/features/auth/forget_password/ui/widgets/reset_pass_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _emailController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordViewModel>(
      create: (context) => getIt<ForgetPasswordViewModel>(),
      child: BlocConsumer<ForgetPasswordViewModel, ForgetPasswordState>(
        listenWhen: (prev, curr) => prev.currentStep != curr.currentStep,
        listener: (context, state) {
          if (state.currentStep < 3) {
            _pageController.animateToPage(
              state.currentStep,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }

          if (state.resetPasswordState.data?.message == "success") {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }

          if (state.resetPasswordState.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.resetPasswordState.errorMessage!)),
            );
          }
        },
        builder: (context, state) {
          final viewModel = context.read<ForgetPasswordViewModel>();

          return Scaffold(
            appBar: CustomAppBar(title: AppConstants.password),
            body: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                EmailStep(
                  state: state,
                  viewModel: viewModel,
                  controller: _emailController,
                ),
                OtpStep(state: state, viewModel: viewModel),
                ResetPasswordStep(
                  state: state,
                  viewModel: viewModel,
                  controller: _newPasswordController,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
