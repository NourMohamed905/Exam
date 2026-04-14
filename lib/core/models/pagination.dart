import 'package:json_annotation/json_annotation.dart';
part 'pagination.g.dart';

@JsonSerializable()
class PaginationInfo {
  @JsonKey(name: "currentPage")
  int? currentPage;
  @JsonKey(name: "numberOfPages")
  int? numberOfPages;
  @JsonKey(name: "limit")
  int? limit;

  PaginationInfo({this.currentPage, this.numberOfPages, this.limit});

  factory PaginationInfo.fromJson(Map<String, dynamic> json) =>
      _$PaginationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationInfoToJson(this);
}
