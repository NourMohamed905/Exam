import 'package:exam_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

abstract class ThemeManager {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorManager.whiteColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primeColor,
      primary: ColorManager.primeColor,
      secondary: ColorManager.accentColor,
      error: ColorManager.errorColor,
      surface: ColorManager.surfaceColor,
    ),
    fontFamily: 'Cairo', // غيّرها لو مستخدم فونت تاني

    cardTheme: CardThemeData(
      color: ColorManager.surfaceColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.black.withOpacity(0.04)),
      ),
      shadowColor: ColorManager.primeColor.withOpacity(0.08),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primeColor,
        foregroundColor: ColorManager.whiteColor,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorManager.primeColor,
        side: BorderSide(color: ColorManager.primeColor, width: 1.5),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.surfaceColor,
      labelStyle: const TextStyle(
        color: ColorManager.greyColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      hintStyle: const TextStyle(
        color: ColorManager.hintColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black.withOpacity(0.08)),
        borderRadius: BorderRadius.circular(14),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black.withOpacity(0.08)),
        borderRadius: BorderRadius.circular(14),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.primeColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorManager.errorColor),
        borderRadius: BorderRadius.circular(14),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.errorColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.surfaceColor,
      selectedItemColor: ColorManager.primeColor,
      unselectedItemColor: ColorManager.greyColor,
      elevation: 0,
    ),
  );
}
