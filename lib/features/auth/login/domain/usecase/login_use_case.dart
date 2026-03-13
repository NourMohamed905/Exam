import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/login/domain/entity/login_request.dart';
import 'package:exam_app/features/auth/login/domain/entity/login_response.dart';
import 'package:exam_app/features/auth/login/domain/repository/login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final LoginRepoContract contract;

  LoginUseCase({required this.contract});

  Future<BaseResponse<LoginResponse>> call(LoginRequest loginRequest) async {
    return await contract.login(loginRequest);
  }
}
