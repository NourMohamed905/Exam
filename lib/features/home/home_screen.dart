import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/config/routes/app_routes.dart';
import 'package:exam_app/core/storage/local_storage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              final storage = getIt<LocalStorageService>();

              await storage.logout();

              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: const Text("Logout", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
