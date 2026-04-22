import 'package:exam_app/features/exam/domain/entity/exam.dart';
import 'package:exam_app/features/exam/domain/entity/exam_response.dart';


class ExamState {
  final bool isLoading;
  final String? errorMessage;
  final List<ExamEntity> exams;

  const ExamState({
    this.isLoading = false,
    this.errorMessage,
    this.exams = const [],
  });

  ExamState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<ExamEntity>? exams,
    ExamResponseEntity? selectedExam,
  }) {
    return ExamState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      exams: exams ?? this.exams,
    );
  }
}