import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/home/home_subject/domain/entity/subject_response.dart';
import 'package:exam_app/features/home/home_subject/domain/usecase/get_subjects_use_case.dart';
import 'package:exam_app/features/home/home_subject/ui/cubit/home_subject_Intent.dart';
import 'package:exam_app/features/home/home_subject/ui/cubit/home_subject_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeSubjectViewModel extends Cubit<HomeState> {
  final GetSubjectsUseCase getSubjectsUseCase;
  HomeSubjectViewModel(this.getSubjectsUseCase) : super(HomeState());

  void doIntent(HomeIntent event) {
    switch (event) {
      case LoadSubjects():
        _getSubjects();
        break;
      case SearchSubjects():
        _searchSubjects(event.query);
    }
  }

  Future<void> refreshSubjects() async {
    return _getSubjects();
  }

  Future<void> _getSubjects() async {
    emit(state.copyWith(isLoading: true));

    final List<ConnectivityResult> connectivityResult = await Connectivity()
        .checkConnectivity();
    final bool hasInternet =
        connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);

    var response = await getSubjectsUseCase.call();

    switch (response) {
      case SuccessBaseResponse<SubjectResponse>():
        emit(
          state.copyWith(
            isLoading: false,
            subjectsList: response.data.subjects,
            filteredSubjects: response.data.subjects,
            showOfflineMessage: !hasInternet,
          ),
        );
        break;

      case ErrorBaseResponse<SubjectResponse>():
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: response.failure.message,
            showOfflineMessage: false,
          ),
        );
    }
  }

  void _searchSubjects(String query) {
    if (query.isEmpty) {
      emit(
        state.copyWith(searchQuery: '', filteredSubjects: state.subjectsList),
      );
      return;
    }

    final filtered = state.subjectsList.where((subject) {
      return subject.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
    }).toList();

    emit(state.copyWith(searchQuery: query, filteredSubjects: filtered));
  }
}
