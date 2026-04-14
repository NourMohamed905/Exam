import 'package:exam_app/features/home/home_subject/domain/entity/subject.dart';
import 'package:json_annotation/json_annotation.dart';
part 'subject_dto.g.dart';

@JsonSerializable()
class SubjectDTO {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "icon")
  String? icon;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  SubjectDTO({this.id, this.name, this.icon, this.createdAt});

  factory SubjectDTO.fromJson(Map<String, dynamic> json) =>
      _$SubjectDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectDTOToJson(this);

  Subject toEntity() {
    return Subject(id: id, name: name, icon: icon);
  }
}
