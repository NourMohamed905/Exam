import 'package:dio/dio.dart';
import 'package:exam_app/core/constants/api_param.dart';
import 'package:exam_app/core/constants/app_endpoints.dart';
import 'package:exam_app/features/exam/data/model/exam_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'exam_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
@Injectable()
abstract class ExamApi {
  @factoryMethod
  factory ExamApi(Dio dio) = _ExamApi;

  @GET(AppEndPoints.getExamById) // baseUrl + endpoint
  Future<ExamResponseDto> getExamsBySubject(

    @Header(ApiParam.token)
    String token, 
    @Query("subject")
    String
    subjectId,
  );
}