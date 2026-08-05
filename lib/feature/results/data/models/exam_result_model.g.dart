// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamResultModel _$ExamResultModelFromJson(Map<String, dynamic> json) =>
    ExamResultModel(
      uid: json['uid'] as String,
      score: (json['score'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      examTitle: json['examTitle'] as String?,
      subjectId: json['subjectId'] as String?,
      subjectName: json['subjectName'] as String?,
      subjectIcon: json['subjectIcon'] as String?,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      userAnswers: (json['userAnswers'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$ExamResultModelToJson(ExamResultModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'score': instance.score,
      'total': instance.total,
      'date': instance.date.toIso8601String(),
      'examTitle': instance.examTitle,
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName,
      'subjectIcon': instance.subjectIcon,
      'questions': instance.questions.map((e) => e.toJson()).toList(),
      'userAnswers': instance.userAnswers,
    };
