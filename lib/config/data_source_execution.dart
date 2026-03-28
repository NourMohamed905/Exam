import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/error/error_handler.dart';
import 'package:injectable/injectable.dart';

@injectable
class DataSourceExecution {
  Future<BaseResponse<T>> execute<T>(Future<T> Function() call) async {
    try {
      final response = await call();
      return SuccessBaseResponse<T>(data: response);
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return ErrorBaseResponse<T>(errorMessage: failure.message);
    }
  }
}
