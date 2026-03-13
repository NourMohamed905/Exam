import 'package:exam_app/api/auth/auth_api.dart';
import 'package:exam_app/core/models/auth_response_dto.dart';
import 'package:exam_app/features/auth/signup/data/data_source/signup_remote_datasource.dart';
import 'package:exam_app/features/auth/signup/data/model/signup_request_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupRemoteDataSourceContract)
class SignupRemoteDatasourceImpl implements SignupRemoteDataSourceContract {
  final AuthApi authApi;
  SignupRemoteDatasourceImpl(this.authApi);

  @override
  Future<AuthResponseDTO> signup(SignupRequestDTO signupRequest) async {
    final response = await authApi.signup(signupRequest.toJson());
    return AuthResponseDTO.fromJson(response.data);
  }
}
