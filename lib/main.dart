import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/config/routes/app_routes.dart';
import 'package:exam_app/config/routes/route_generator.dart';
import 'package:exam_app/core/storage/local_storage.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  final storage = LocalStorageService();

  final token = await storage.getToken();
  final remember = await storage.getRememberMe();

  final isLoggedIn = remember && token != null && token.isNotEmpty;
  runApp(ExamApp(isLoggedIn: isLoggedIn));
}

class ExamApp extends StatelessWidget {
  final bool isLoggedIn;
  const ExamApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: isLoggedIn ? AppRoutes.home : AppRoutes.login,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
