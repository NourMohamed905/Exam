// search_text_field.dart
import 'package:exam_app/core/constant/app_text_constants.dart';
import 'package:exam_app/core/utils/color_manager.dart';
import 'package:exam_app/feature/explore/presentation/view_model/explore_cubit.dart';
import 'package:exam_app/feature/explore/presentation/view_model/explore_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<ExploreCubit>().doIntent(FilterSubjectsIntent(value));
      },
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: ColorManager.blackColor,
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: ColorManager.greyColor,
          size: 22,
        ),
        hintText: AppTextConstants.search,
        hintStyle: const TextStyle(
          color: ColorManager.hintColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: ColorManager.navBarColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: ColorManager.primeColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
