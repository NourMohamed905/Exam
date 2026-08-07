import 'package:exam_app/core/utils/app_validation.dart';
import 'package:exam_app/core/utils/color_manager.dart';
import 'package:exam_app/core/utils/router/app_routes.dart';
import 'package:exam_app/core/utils/widgets/custom_elevated_button.dart';
import 'package:exam_app/core/utils/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';

import '../Bloc/login_bloc.dart';
import '../Bloc/login_event.dart';
import '../Bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FB),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status == LoginStatus.success) {
              Future.microtask(() async {
                await QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  title: 'Login Successful',
                  confirmBtnText: 'Continue',
                  confirmBtnColor: ColorManager.primeColor,
                  barrierDismissible: false,
                  showCancelBtn: false,
                );
                if (!mounted) return;
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.explore,
                  (route) => false,
                );
              });
            }

            if (state.status == LoginStatus.error) {
              final errorMessage = state.errorMessage ?? 'An error occurred';
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
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: ColorManager.blackColor,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Login to your account to continue",
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorManager.greyColor,
                          ),
                        ),
                        const SizedBox(height: 32),
                        _buildTextField(
                          controller: _emailController,
                          label: 'Email',
                          hint: 'Enter your email',
                          icon: Icons.email_outlined,
                          validator: AppValidators.emailValidation,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          controller: _passwordController,
                          label: 'Password',
                          hint: 'Enter your password',
                          icon: Icons.lock_outline,
                          isPassword: true,
                          obscureText: _obscurePassword,
                          onToggleVisibility: () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
                          validator: AppValidators.passwordValidation,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Checkbox(
                                    value: _rememberMe,
                                    activeColor: ColorManager.primeColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    onChanged: (v) => setState(
                                      () => _rememberMe = v ?? false,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Remember Me",
                                  style: TextStyle(
                                    color: ColorManager.blackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () => Navigator.pushNamed(
                                context,
                                AppRoutes.forgetPasswordScreen,
                              ),
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: ColorManager.primeColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            final isLoading =
                                state.status == LoginStatus.loading;
                            return SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: CustomButton(
                                title: isLoading ? 'Logging in...' : 'Login',
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<LoginBloc>().add(
                                            LoginSubmitted(
                                              email: _emailController.text
                                                  .trim(),
                                              password:
                                                  _passwordController.text,
                                              rememberMe: _rememberMe,
                                            ),
                                          );
                                        }
                                      },
                                isEnabled: !isLoading,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: ColorManager.greyColor,
                                fontSize: 15,
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.register,
                              ),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: ColorManager.primeColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      height: 200 + topPadding,
      width: double.infinity,
      padding: EdgeInsets.only(top: topPadding),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorManager.primeColorDark,
            ColorManager.primeColor,
            ColorManager.primeColorLight,
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: CircleAvatar(
              radius: 120,
              backgroundColor: Colors.white.withValues(alpha: 0.06),
            ),
          ),
          Positioned(
            bottom: 20,
            left: -30,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white.withValues(alpha: 0.06),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    size: 56,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Elevate Exam",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ColorManager.blackColor,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: ColorManager.hintColor,
                fontSize: 14,
              ),
              prefixIcon: Icon(icon, color: ColorManager.primeColor, size: 20),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: ColorManager.hintColor,
                        size: 20,
                      ),
                      onPressed: onToggleVisibility,
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: ColorManager.primeColor,
                  width: 1.5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: ColorManager.errorColor,
                  width: 1.2,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
