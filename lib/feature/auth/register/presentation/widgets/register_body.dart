import 'package:exam_app/core/constant/app_text_constants.dart';
import 'package:exam_app/core/utils/color_manager.dart';
import 'package:exam_app/core/utils/router/app_routes.dart';
import 'package:exam_app/core/utils/widgets/custom_snack_bar.dart';
import 'package:exam_app/feature/auth/register/presentation/viewModel/register_cubit.dart';
import 'package:exam_app/feature/auth/register/presentation/viewModel/register_state.dart';
import 'package:exam_app/feature/auth/register/presentation/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == RegisterStatus.success) {
          CustomSnackBar.success(context, AppTextConstants.signupSuccess);
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
        } else if (state.status == RegisterStatus.error) {
          final errorMessage =
              state.errorMessage ?? AppTextConstants.genericError;
          final isNetworkIssue =
              errorMessage.toLowerCase().contains('internet') ||
              errorMessage.toLowerCase().contains('connection') ||
              errorMessage.toLowerCase().contains('network');

          if (isNetworkIssue) {
            CustomSnackBar.networkError(context, errorMessage);
          } else {
            CustomSnackBar.error(context, errorMessage);
          }
        }
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildHeader(context),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: RegisterForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [ColorManager.primeColor, Color(0xff1A4BAF)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            right: -40,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white.withValues(alpha: 0.05),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create Account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Join us and start your assessment journey",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
