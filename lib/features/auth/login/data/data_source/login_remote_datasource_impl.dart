import 'package:exam_app/api/auth/auth_api.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/app_executor.dart';
import 'package:exam_app/core/models/auth_response_dto.dart';
import 'package:exam_app/features/auth/login/data/data_source/login_remote_datasource.dart';
import 'package:exam_app/features/auth/login/data/model/login_request_dto.dart';
import 'package:exam_app/features/auth/login/domain/entity/login_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDataSourceContract)
class LoginRemoteDatasourceImpl implements LoginRemoteDataSourceContract {
  final AuthApi authApi;
  final AppExecutor executor;

  LoginRemoteDatasourceImpl(this.authApi, this.executor);

  @override
  Future<BaseResponse<LoginResponse>> login(LoginRequestDTO request) {
    return executor.execute<LoginResponse>(() async {
      final response = await authApi.login(request.toJson());

      final dto = AuthResponseDTO.fromJson(response.data);

      return LoginResponse(token: dto.token!, user: dto.user!.toDomain());
    });
  }
}
