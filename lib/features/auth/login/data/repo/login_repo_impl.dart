import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/error/error_handler.dart';
import 'package:exam_app/features/auth/login/data/data_source/login_remote_datasource.dart';
import 'package:exam_app/features/auth/login/domain/entity/login_request.dart';
import 'package:exam_app/features/auth/login/domain/entity/login_response.dart';
import 'package:exam_app/features/auth/login/domain/repository/login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepoContract)
class LoginRepoImpl implements LoginRepoContract {
  final LoginRemoteDataSourceContract remoteDataSource;

  LoginRepoImpl({required this.remoteDataSource});
  @override
  Future<BaseResponse<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await remoteDataSource.login(loginRequest.toDTO());

      if (response.user == null || response.token == null) {
        return ErrorBaseResponse<LoginResponse>(
          errorMessage: "Invalid login response",
        );
      }

      final authResponse = LoginResponse(
        token: response.token!,
        user: response.user!.toDomain(),
      );

      return SuccessBaseResponse<LoginResponse>(data: authResponse);
    } catch (error) {
      final failure = ErrorHandler.handle(error);

      return ErrorBaseResponse<LoginResponse>(errorMessage: failure.message);
    }
  }
}
