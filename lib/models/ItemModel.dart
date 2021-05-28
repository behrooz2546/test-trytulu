import 'package:json_annotation/json_annotation.dart';

part 'ItemModel.g.dart';

@JsonSerializable()
class ItemModel {
  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'input')
  String input;

  ItemModel({
    required this.title,
    required this.input,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
