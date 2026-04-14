import 'package:exam_app/core/constants/home_constants.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SearchSubjectsWidget extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchSubjectsWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: HomeConstants.searchHint,
        hintStyle: TextStyle(color: AppColors.darkGray),
        prefixIcon: const Icon(Icons.search, color: AppColors.darkGray),
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppSize.s14,
          horizontal: AppSize.s16,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s60),
          borderSide: const BorderSide(color: AppColors.darkGray, width: 1.0),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s60),
          borderSide: const BorderSide(color: AppColors.darkGray, width: 1.0),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s60),
          borderSide: const BorderSide(color: AppColors.darkGray, width: 1.0),
        ),
      ),
    );
  }
}
