import 'package:exam_app/feature/explore/data/model/subject_model_dto.dart';

abstract interface class ExploreRemoteDatasource {
  Future<List<SubjectModelDto>> getAllSubject();
}
