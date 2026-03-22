import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool isPassword;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final AutovalidateMode? autovalidateMode;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.validator,
    this.controller,
    this.onChanged,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: autovalidateMode,
      obscureText: isPassword,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: getRegularStyle(color: AppColors.black, fontSize: 16),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
