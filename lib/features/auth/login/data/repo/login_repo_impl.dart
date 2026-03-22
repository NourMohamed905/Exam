import 'package:exam_app/config/base_response/base_response.dart';
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
  Future<BaseResponse<LoginResponse>> login(LoginRequest loginRequest) {
    return remoteDataSource.login(loginRequest.toDTO());
  }
}
