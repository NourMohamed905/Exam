import 'package:exam_app/config/routes/app_routes.dart';
import 'package:exam_app/core/resources/app_images.dart';
import 'package:exam_app/core/storage/local_storage.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    final storage = LocalStorageService();
    final token = await storage.getToken();
    final remember = await storage.getRememberMe();

    final isLoggedIn = remember && token != null && token.isNotEmpty;

    Navigator.pushReplacementNamed(
      context,
      isLoggedIn ? AppRoutes.home : AppRoutes.login,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryBlue,
              Colors.lightBlueAccent,
              AppColors.lightGray,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Lottie.asset(
            AppImages.splashLogo,
            height: 200.h,
            width: 200.w,
            repeat: false,
          ),
        ),
      ),
    );
  }
}
