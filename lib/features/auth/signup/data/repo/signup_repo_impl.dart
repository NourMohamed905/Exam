import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/error/error_handler.dart';
import 'package:exam_app/features/auth/signup/data/data_source/signup_remote_datasource.dart';
import 'package:exam_app/features/auth/signup/domain/entity/signup_request.dart';
import 'package:exam_app/features/auth/signup/domain/entity/signup_response.dart';
import 'package:exam_app/features/auth/signup/domain/repository/signup_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupRepoContract)
class SignupRepoImpl implements SignupRepoContract {
  final SignupRemoteDataSourceContract remoteDataSource;

  SignupRepoImpl({required this.remoteDataSource});

  @override
  Future<BaseResponse<SignupResponse>> signup(
      SignupRequest signupRequest) async {
    try {
      final response = await remoteDataSource.signup(signupRequest.toDTO());

      if (response.user == null || response.token == null) {
        return ErrorBaseResponse<SignupResponse>(
          errorMessage: "Invalid signup response",
        );
      }

      final signupResponse = SignupResponse(
        token: response.token!,
        user: response.user!.toDomain(),
      );

      return SuccessBaseResponse<SignupResponse>(data: signupResponse);
    } catch (error) {
      final failure = ErrorHandler.handle(error);

      return ErrorBaseResponse<SignupResponse>(errorMessage: failure.message);
    }
  }
}
