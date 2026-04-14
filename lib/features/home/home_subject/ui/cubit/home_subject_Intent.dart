sealed class HomeIntent {}

class LoadSubjects extends HomeIntent {}

class SearchSubjects extends HomeIntent {
  final String query;
  SearchSubjects(this.query);
}
