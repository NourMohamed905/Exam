import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/widgets/cached_network_image_widget.dart';
import 'package:exam_app/features/exam/domain/entity/exam.dart';

import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class ExamDetailsScreen extends StatelessWidget {
  final ExamEntity examList;
  final String urlToImage;
  const ExamDetailsScreen({
    super.key,
    required this.examList,
    required this.urlToImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 Image
                CachedNetworkImageWidget(urlToImage: urlToImage),

                SizedBox(width: 10),

                /// 🔹 Text Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Text(
                        "Languages",
                        style: getBoldStyle(
                          fontSize: 20,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Wrap(
                        spacing: 4,
                        runSpacing: 2,
                        children: [
                          Text(
                            "${examList.title ?? "Not Found"} |",
                            style: getMediumStyle(
                              color: AppColors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${examList.numberOfQuestions ?? 0} Questions",
                            style: getRegularStyle(
                              color: AppColors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// 🔹 Duration
                Text(
                  "${examList.duration ?? 0} Minutes",
                  style: getMediumStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSize.s10),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: AppSize.s20),
            Text(
              "Instructions",
              style: getMediumStyle(
                color: AppColors.black,
                fontSize: AppSize.s20,
              ),
            ),
            SizedBox(height: AppSize.s10),
            _buildInstructionStatic(),
            const Spacer(),
            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(14),
                  backgroundColor: AppColors.primaryBlue,
                ),
                onPressed: () {
                  // TODO: navigate to questions screen
                },
                child: const Text("Start Exam", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionStatic() {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        4,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.circle, size: 10, color: AppColors.black),
              SizedBox(width: AppSize.s10),
              Text(
                'Lorem ipsum dolor sit amet consectetur.',
                style: getRegularStyle(color: AppColors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}