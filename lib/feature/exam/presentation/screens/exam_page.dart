import 'package:exam_app/core/utils/color_manager.dart';
import 'package:exam_app/core/utils/router/app_routes.dart';
import 'package:flutter/material.dart' hide RadioGroup;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/widgets/radio_group.dart';
import '../Bloc/exam_bloc.dart';
import '../Bloc/exam_event.dart';
import '../Bloc/exam_state.dart';

class ExamPage extends StatefulWidget {
  final String examId;
  const ExamPage({super.key, required this.examId});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  @override
  void initState() {
    super.initState();
    context.read<ExamBloc>().add(GetExamQuestionsEvent(widget.examId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        top: false,
        child: MultiBlocListener(
          listeners: [
            BlocListener<ExamBloc, ExamState>(
              listenWhen: (previous, current) =>
                  previous.score != current.score,
              listener: (context, state) {
                if (state.score != null && state.result != null) {
                  Navigator.of(context).pushReplacementNamed(
                    AppRoutes.score,
                    arguments: {
                      'score': state.score!,
                      'total': state.data?.questions?.length ?? 0,
                      'result': state.result!,
                      'examId': widget.examId,
                    },
                  );
                }
              },
            ),
            BlocListener<ExamBloc, ExamState>(
              listenWhen: (previous, current) =>
                  previous.timerStatus != current.timerStatus,
              listener: (context, state) {
                if (state.timerStatus == TimerStatus.finished) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (dialogContext) => PopScope(
                      canPop: false,
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        backgroundColor: Colors.white,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: ColorManager.errorColor.withValues(
                                  alpha: 0.1,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.timer_off_rounded,
                                size: 44,
                                color: ColorManager.errorColor,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Time's Up!",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.blackColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "The exam session has ended. Let's see how you did!",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: ColorManager.greyColor),
                            ),
                          ],
                        ),
                        actions: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorManager.primeColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: () {
                                context.read<ExamBloc>().add(FinishExamEvent());
                                Navigator.of(dialogContext).pop();
                              },
                              child: const Text(
                                'View Score',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<ExamBloc, ExamState>(
            builder: (context, state) {
              if (state.status == ExamStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primeColor,
                  ),
                );
              }

              if (state.status == ExamStatus.error &&
                  state.errorMessage != null) {
                return Center(
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
                          state.errorMessage!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: ColorManager.greyColor),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final question = state.currentQuestion;
              if (question == null) {
                return const Center(child: Text("No questions found"));
              }

              final totalQuestions = state.data?.questions?.length ?? 0;
              final progress = totalQuestions > 0
                  ? (state.currentIndex + 1) / totalQuestions
                  : 0.0;

              return Column(
                children: [
                  _buildHeader(context, state, progress, totalQuestions),
                  // Question Content
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.question ?? "",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.blackColor,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: ColorManager.surfaceColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorManager.primeColor.withValues(
                                    alpha: 0.06,
                                  ),
                                  blurRadius: 16,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: RadioGroup<String>(
                              key: ValueKey(question.id),
                              isMultipleChoice:
                                  question.type != "single_choice",
                              initialValues: state.answers[state.currentIndex],
                              options:
                                  question.answers
                                      ?.map(
                                        (a) => RadioGroupOption(
                                          value: a.key ?? "",
                                          label: a.answer ?? "",
                                        ),
                                      )
                                      .toList() ??
                                  [],
                              onChanged: (values) {
                                context.read<ExamBloc>().add(
                                  UpdateAnswerEvent(values),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  // Navigation Buttons
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        if (!state.isFirstQuestion)
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                context.read<ExamBloc>().add(
                                  PreviousQuestionEvent(),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                side: const BorderSide(
                                  color: ColorManager.whiteBlueColor,
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text(
                                "Back",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.primeColor,
                                ),
                              ),
                            ),
                          ),
                        if (!state.isFirstQuestion) const SizedBox(width: 16),
                        Expanded(
                          flex: state.isFirstQuestion ? 1 : 1,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  ColorManager.primeColor,
                                  ColorManager.primeColorLight,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorManager.primeColor.withValues(
                                    alpha: 0.3,
                                  ),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (state.isLastQuestion) {
                                  context.read<ExamBloc>().add(
                                    FinishExamEvent(),
                                  );
                                } else {
                                  context.read<ExamBloc>().add(
                                    NextQuestionEvent(),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Text(
                                state.isLastQuestion ? "Finish" : "Next",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    ExamState state,
    double progress,
    int totalQuestions,
  ) {
    final bool isLowTime = state.timerStatus == TimerStatus.lowTime;
    final Color timerColor = isLowTime ? Colors.white : Colors.white;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.of(context).padding.top + 16,
        20,
        24,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Exam',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isLowTime
                      ? ColorManager.errorColor.withValues(alpha: 0.25)
                      : ColorManager.successColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.timer_outlined, color: timerColor, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      state.formattedTime,
                      style: TextStyle(
                        fontSize: 15,
                        color: timerColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Question ${state.currentIndex + 1}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primeColorDark,
                ),
              ),
              Text(
                "of $totalQuestions",
                style: TextStyle(
                  fontSize: 14,
                  color: ColorManager.primeColorDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: ColorManager.primeColorDark.withValues(
                alpha: 0.10,
              ),
              color: ColorManager.primeColorDark,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
