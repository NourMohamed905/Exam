import 'package:exam_app/features/profile/domain/entity/update_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_user_dto.g.dart';

@JsonSerializable()
class UpdateUserDTO {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "isVerified")
  bool? isVerified;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "passwordChangedAt")
  DateTime? passwordChangedAt;

  UpdateUserDTO({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.isVerified,
    this.createdAt,
    this.passwordChangedAt,
  });

  factory UpdateUserDTO.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserDTOToJson(this);

  UpdateUser toDomain() {
    return UpdateUser(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );
  }
}
