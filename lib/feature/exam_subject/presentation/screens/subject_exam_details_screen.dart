import 'package:exam_app/core/utils/color_manager.dart';
import 'package:exam_app/core/utils/router/app_routes.dart';
import 'package:exam_app/core/utils/widgets/custom_elevated_button.dart';
import 'package:exam_app/feature/exam_subject/domain/models/exam_subject_model.dart';
import 'package:flutter/material.dart';

class SubjectExamDetailsScreen extends StatelessWidget {
  const SubjectExamDetailsScreen({super.key, required this.modal});
  final ExamSubjectModel modal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Stats Section
                        Row(
                          children: [
                            _buildInfoTile(
                              icon: Icons.help_outline_rounded,
                              label: 'Questions',
                              value: '${modal.numberOfQuestions}',
                            ),
                            const SizedBox(width: 16),
                            _buildInfoTile(
                              icon: Icons.timer_outlined,
                              label: 'Duration',
                              value: '${modal.duration} Min',
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        // Instructions Section
                        const Text(
                          'Instructions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.blackColor,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildInstructionItem(
                          'Read each question carefully before answering.',
                        ),
                        _buildInstructionItem(
                          'You can go back and change your answers.',
                        ),
                        _buildInstructionItem(
                          'Ensure you have a stable internet connection.',
                        ),
                        _buildInstructionItem(
                          'The timer will start as soon as you begin.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Start Button Footer
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: CustomButton(
              title: 'Start Exam',
              onPressed: () {
                Navigator.of(
                  context,
                ).pushNamed(AppRoutes.exam, arguments: modal.id);
              },
              isEnabled: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.of(context).padding.top + 15,
        20,
        32,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorManager.primeColor, ColorManager.whiteColor],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              const Expanded(
                child: Text(
                  'Exam Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 34),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.assignment_turned_in_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            modal.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: ColorManager.primeColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 0),
          Text(
            'Programming Assessment',
            style: TextStyle(color: ColorManager.primeColorLight, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        decoration: BoxDecoration(
          color: ColorManager.surfaceColor,
          borderRadius: BorderRadius.circular(18),
          // boxShadow: [
          //   BoxShadow(
          //     color: ColorManager.primeColor.withValues(alpha: 0.06),
          //     blurRadius: 16,
          //     offset: const Offset(0, 6),
          //   ),
          // ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorManager.whiteBlueColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: ColorManager.primeColor, size: 20),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                color: ColorManager.blackColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                color: ColorManager.greyColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: ColorManager.whiteBlueColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              size: 12,
              color: ColorManager.primeColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: ColorManager.greyColor,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
