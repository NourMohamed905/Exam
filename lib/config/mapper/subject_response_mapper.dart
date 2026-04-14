import 'package:exam_app/features/home/home_subject/data/model/subject_dto.dart';
import 'package:exam_app/features/home/home_subject/data/model/subject_response_dto.dart';
import 'package:exam_app/features/home/home_subject/domain/entity/subject.dart';
import 'package:exam_app/features/home/home_subject/domain/entity/subject_response.dart';

extension SubjectResponseMapper on SubjectResponse {
  SubjectResponseDTO toDTO() {
    return SubjectResponseDTO(
      message: message,
      metadata: metadata,
      subjects: subjects?.map((e) => e.toDTO()).toList(),
    );
  }
}

extension SubjectMapper on Subject {
  SubjectDTO toDTO() {
    return SubjectDTO(id: id, name: name, icon: icon);
  }
}
