import 'package:exam_app/api/auth/auth_api.dart';
import 'package:exam_app/core/models/auth_response_dto.dart';
import 'package:exam_app/features/auth/login/data/data_source/login_remote_datasource.dart';
import 'package:exam_app/features/auth/login/data/model/login_request_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDataSourceContract)
class LoginRemoteDatasourceImpl implements LoginRemoteDataSourceContract {
  final AuthApi authApi;
  LoginRemoteDatasourceImpl(this.authApi);

  @override
  Future<AuthResponseDTO> login(LoginRequestDTO loginRequest) async {
    final response = await authApi.login(loginRequest.toJson());
    return AuthResponseDTO.fromJson(response.data);
  }
}
