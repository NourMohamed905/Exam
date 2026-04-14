import 'package:exam_app/features/home/home_subject/domain/entity/subject.dart';

class HomeState {
  bool isLoading = true;
  List<Subject> subjectsList = [];
  List<Subject> filteredSubjects = [];
  String searchQuery = '';
  String? errorMessage;
  bool showOfflineMessage = false;

  HomeState({
    this.isLoading = true,
    this.subjectsList = const [],
    this.filteredSubjects = const [],
    this.searchQuery = '',
    this.errorMessage,
    this.showOfflineMessage = false,
  });

  HomeState copyWith({
    bool? isLoading,
    List<Subject>? subjectsList,
    List<Subject>? filteredSubjects,
    String? searchQuery,
    String? errorMessage,
    bool? showOfflineMessage,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      subjectsList: subjectsList ?? this.subjectsList,
      filteredSubjects: filteredSubjects ?? this.filteredSubjects,
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage: errorMessage ?? this.errorMessage,
      showOfflineMessage: showOfflineMessage ?? this.showOfflineMessage,
    );
  }
}
