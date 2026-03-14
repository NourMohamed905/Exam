import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/forget_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/forget_pass_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/repository/forget_pass_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
  final ForgetPassRepoContract repository;

  ForgetPasswordUseCase(this.repository);

  Future<BaseResponse<ForgetPasswordResponse>> call(
    ForgetPasswordRequest request,
  ) {
    return repository.forgetPassword(request);
  }
}
