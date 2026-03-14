import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/request/reset_pass_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entity/response/reset_pass_response.dart';
import 'package:exam_app/features/auth/forget_password/domain/repository/forget_pass_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  final ForgetPassRepoContract repository;

  ResetPasswordUseCase(this.repository);

  Future<BaseResponse<ResetPasswordResponse>> call(
    ResetPasswordRequest request,
  ) {
    return repository.resetPassword(request);
  }
}
