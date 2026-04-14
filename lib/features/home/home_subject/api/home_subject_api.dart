import 'package:dio/dio.dart';
import 'package:exam_app/core/constants/api_param.dart';
import 'package:exam_app/core/constants/app_endpoints.dart';
import 'package:exam_app/features/home/home_subject/data/model/subject_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'home_subject_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
@Injectable()
abstract class HomeSubjectApiService {
  @factoryMethod
  factory HomeSubjectApiService(Dio dio) = _HomeSubjectApiService;

  /// Get all subjects
  @GET(AppEndPoints.getAllSubjects)
  Future<SubjectResponseDTO> getAllSubjects(
    @Header(ApiParam.token) String token,
  );
}
