class AppEndPoints {
  AppEndPoints._();

  static const String baseUrl = "https://exam.elevateegy.com/api/v1";

  /// Auth
  static const String signup = "$baseUrl/auth/signup";
  static const String login = "$baseUrl/auth/signin";
  static const String changePassword = "$baseUrl/auth/changePassword";
  static const String deleteAccount = "$baseUrl/auth/deleteMe";
  static const String editProfile = "$baseUrl/auth/editProfile";
  static const String logout = "$baseUrl/auth/logout";
  static const String getUserInfo = "$baseUrl/auth/profileData";
  static const String forgotPassword = "$baseUrl/auth/forgotPassword";
  static const String verifyResetCode = "$baseUrl/auth/verifyResetCode";
  static const String resetPassword = "$baseUrl/auth/resetPassword";

  /// Exams
  static const String addExam = "$baseUrl/exams";
  static const String getAllExams = "$baseUrl/exams";
  static const String getExamById = "$baseUrl/exams/";

  /// Questions
  static const String addQuestion = "$baseUrl/questions";
  static const String getAllQuestions = "$baseUrl/questions";
  static const String getQuestionById = "$baseUrl/questions/";

  /// Subjects
  static const String addSubject = "$baseUrl/subjects";
  static const String updateSubject = "$baseUrl/subjects/";
  static const String deleteSubject = "$baseUrl/subjects/";
  static const String getAllSubjects = "$baseUrl/subjects";
  static const String getSubjectById = "$baseUrl/subjects/";
}
