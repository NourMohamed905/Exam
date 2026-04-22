import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/resources/style_manager.dart';
import 'package:exam_app/core/resources/values_manager.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/cached_network_image_widget.dart';
import 'package:exam_app/features/exam/ui/cubit/exam_intent.dart';
import 'package:exam_app/features/exam/ui/cubit/exam_state.dart';
import 'package:exam_app/features/exam/ui/cubit/exam_view_model.dart';
import 'package:exam_app/features/exam/ui/screen/exam_detail_screen.dart';
import 'package:exam_app/features/home/home_subject/domain/entity/subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamListScreen extends StatefulWidget {
  final Subject subject;

  const ExamListScreen({super.key, required this.subject});

  @override
  State<ExamListScreen> createState() => _ExamListScreenState();
}

class _ExamListScreenState extends State<ExamListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ExamViewModel>()
            ..handleIntent(LoadExamsBySubject(widget.subject.id ?? "")),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Exams",
            style: getBoldStyle(color: AppColors.black, fontSize: 18),
          ),
        ),
        body: BlocBuilder<ExamViewModel, ExamState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.errorMessage != null) {
              return Center(child: Text(state.errorMessage!));
            }

            final exams = state.exams;

            if (exams.isEmpty) {
              return const Center(child: Text("No exams found"));
            }

            return Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: ListView.builder(
                itemCount: exams.length,
                itemBuilder: (context, index) {
                  final exam = exams[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppPadding.p12),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ExamDetailsScreen(
                              examList: exam,
                              urlToImage: widget.subject.icon ?? "not found",
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(AppPadding.p16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.grey.withOpacity(0.2),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CachedNetworkImageWidget(
                              urlToImage: widget.subject.icon ?? "not found",
                            ),

                            const SizedBox(width: AppSize.s12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exam.title ?? "Exam",
                                    style: getBoldStyle(
                                      fontSize: 16,
                                      color: AppColors.black,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    "${exam.numberOfQuestions ?? 0} Questions",
                                    style: getRegularStyle(
                                      color: AppColors.grey,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    "Duration: ${exam.duration ?? 0} min",
                                    style: getRegularStyle(
                                      color: AppColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              "${exam.duration ?? 0} min",
                              style: getMediumStyle(
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}