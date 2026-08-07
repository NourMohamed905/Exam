import 'package:exam_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class CustomSnackBar {
  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    final messenger = ScaffoldMessenger.of(context);

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(icon, color: ColorManager.whiteBlueColor),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  message,
                  style: TextStyle(
                    color: ColorManager.surfaceColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      );
  }

  static void success(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: ColorManager.successColor,
      icon: Icons.check_circle,
    );
  }

  static void error(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: ColorManager.errorColor,
      icon: Icons.error,
    );
  }

  static Future<void> networkError(BuildContext context, String message) async {
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Connection Error',
      text: message,
      confirmBtnText: 'Try Again',
      confirmBtnColor: ColorManager.primeColor,
      barrierDismissible: true,
      showCancelBtn: false,
    );
  }

  static void info(
    BuildContext context,
    String message, {
    IconData icon = Icons.info,
  }) {
    _show(
      context,
      message: message,
      backgroundColor: ColorManager.hintColor,
      icon: icon,
    );
  }
}
