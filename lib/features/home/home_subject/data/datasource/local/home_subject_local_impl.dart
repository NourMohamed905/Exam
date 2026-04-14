import 'dart:convert';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/mapper/subject_response_mapper.dart';
import 'package:exam_app/core/constants/hive_constants.dart';
import 'package:exam_app/features/home/home_subject/data/datasource/local/home_subject_local_contract.dart';
import 'package:exam_app/features/home/home_subject/data/model/subject_response_dto.dart';
import 'package:exam_app/features/home/home_subject/domain/entity/subject_response.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeSubjectLocalContract)
class HomeSubjectLocalImpl implements HomeSubjectLocalContract {
  @override
  Future<void> cacheSubjects(SubjectResponse subjectResponse) async {
    var box = await Hive.openBox(SubjectsCache.box);
    await box.put(
      SubjectsCache.key,
      jsonEncode(subjectResponse.toDTO().toJson()),
    );
    await box.close();
  }

  @override
  Future<BaseResponse<SubjectResponse>> getAllSubjects() async {
    try {
      var box = await Hive.openBox(SubjectsCache.box);

      final cachedData = box.get(SubjectsCache.key);

      await box.close();

      if (cachedData == null) {
        return SuccessBaseResponse(data: SubjectResponse());
      }

      final decoded = jsonDecode(cachedData as String);
      final dto = SubjectResponseDTO.fromJson(decoded);

      return SuccessBaseResponse(data: dto.toEntity());
    } catch (e) {
      return SuccessBaseResponse(data: SubjectResponse());
    }
  }
}
