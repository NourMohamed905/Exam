import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam/domain/entity/exam_response.dart';
import 'package:exam_app/features/exam/domain/usecase/get_exam_details_usecase.dart';
import 'package:exam_app/features/exam/ui/cubit/exam_intent.dart';
import 'package:exam_app/features/exam/ui/cubit/exam_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExamViewModel extends Cubit<ExamState> {
  final GetExamDetailsUseCase getExamDetailsUseCase;

  ExamViewModel(this.getExamDetailsUseCase) : super(const ExamState());

  // =========================
  void handleIntent(ExamIntent intent) {
    switch (intent) {
      case LoadExamsBySubject():
        _getExams(intent.subjectId);
        break;
    }
  }

  // =========================
  Future<void> _getExams(String subjectId) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await getExamDetailsUseCase(subjectId);

    if (result is SuccessBaseResponse<ExamResponseEntity>) {
      emit(state.copyWith(isLoading: false, exams: result.data.exams));
    } else if (result is ErrorBaseResponse<ExamResponseEntity>) {
      emit(
        state.copyWith(isLoading: false, errorMessage: result.failure.message),
      );
    }
  }
}