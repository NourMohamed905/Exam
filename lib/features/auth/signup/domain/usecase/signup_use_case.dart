import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/signup/domain/entity/signup_request.dart';
import 'package:exam_app/features/auth/signup/domain/entity/signup_response.dart';
import 'package:exam_app/features/auth/signup/domain/repository/signup_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUseCase {
  final SignupRepoContract contract;

  SignupUseCase({required this.contract});

  Future<BaseResponse<SignupResponse>> call(SignupRequest signupRequest) async {
    return await contract.signup(signupRequest);
  }
}
