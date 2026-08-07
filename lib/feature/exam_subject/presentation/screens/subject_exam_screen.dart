import 'package:exam_app/core/utils/color_manager.dart';
import 'package:exam_app/feature/exam_subject/presentation/view_model/cubit/exam_subject_cubit.dart';
import 'package:exam_app/feature/exam_subject/presentation/view_model/states/exam_subject_state.dart';
import 'package:exam_app/feature/exam_subject/presentation/widgets/custom_exam_card.dart';
import 'package:exam_app/core/utils/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectExamScreen extends StatelessWidget {
  const SubjectExamScreen({super.key, required this.subjectId});
  final String subjectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeader(context)),
          BlocBuilder<ExamSubjectCubit, ExamSubjectState>(
            builder: (BuildContext context, ExamSubjectState state) {
              switch (state.status) {
                case ExamSubjectStatus.loading:
                  return const SliverFillRemaining(
                    child: Center(child: LoadingAnimation()),
                  );
                case ExamSubjectStatus.error:
                  return SliverFillRemaining(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline_rounded,
                              size: 60,
                              color: ColorManager.errorColor,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              state.errorMessage ?? 'An error occurred',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: ColorManager.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                case ExamSubjectStatus.success:
                  if (state.exams == null || state.exams!.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'No exams available for this subject',
                          style: TextStyle(color: ColorManager.greyColor),
                        ),
                      ),
                    );
                  }
                  return SliverList.builder(
                    itemCount: state.exams!.length,
                    itemBuilder: (context, index) =>
                        CustomExamCard(examSubjectModel: state.exams![index]),
                  );
                case ExamSubjectStatus.initial:
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
              }
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.of(context).padding.top + 10,
        20,
        25,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [ColorManager.primeColor, ColorManager.primeColorLight],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

              const Text(
                'Available Exams',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
          Text(
            'Select an exam to start your assessment',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
