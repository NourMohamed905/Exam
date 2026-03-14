import 'package:exam_app/features/auth/forget_password/data/model/request/verify_code_request_dto.dart';

class VerifyCodeRequest {
  String? resetCode;

  VerifyCodeRequest({this.resetCode});

  VerifyCodeRequestDTO toDTO() {
    return VerifyCodeRequestDTO(resetCode: resetCode);
  }
}
