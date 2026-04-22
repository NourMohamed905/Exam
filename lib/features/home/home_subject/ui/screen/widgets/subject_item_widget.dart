import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/cached_network_image_widget.dart';
import 'package:exam_app/features/exam/ui/screen/exam_list_screen.dart';
import 'package:exam_app/features/home/home_subject/domain/entity/subject.dart';
import 'package:flutter/material.dart';

class SubjectItemWidget extends StatelessWidget {
  final Subject subject;
  const SubjectItemWidget({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ExamListScreen(subject: subject)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkGray.withAlpha(60),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(1, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CachedNetworkImageWidget(urlToImage: subject.icon ?? ""),
            const SizedBox(width: AppSize.s16),
            Text(
              subject.name ?? "",
              style: getRegularStyle(
                color: AppColors.black,
                fontSize: AppSize.s16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
