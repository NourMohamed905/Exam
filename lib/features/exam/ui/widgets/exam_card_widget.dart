import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/domain/entity/exam.dart';
import 'package:flutter/material.dart';

class ExamCardWidget extends StatelessWidget {
  final ExamEntity exam;
  final VoidCallback onTap;

  const ExamCardWidget({super.key, required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: AppColors.grey.withOpacity(0.2), blurRadius: 5),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.quiz, size: 40, color: AppColors.primaryBlue),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exam.title ?? "Not Found",
                    style: getBoldStyle(fontSize: 16, color: AppColors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${exam.numberOfQuestions} Questions",
                    style: getRegularStyle(color: AppColors.grey),
                  ),
                  Text(
                    "Duration: ${exam.duration} min",
                    style: getRegularStyle(color: AppColors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}