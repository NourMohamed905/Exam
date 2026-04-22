sealed class ExamIntent {}

class LoadExamsBySubject extends ExamIntent {
  final String subjectId;

  LoadExamsBySubject(this.subjectId);
}