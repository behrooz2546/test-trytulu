// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChecklistModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckListModel _$CheckListModelFromJson(Map<String, dynamic> json) {
  return CheckListModel(
    name: json['name'] as String,
    items: (json['items'] as List<dynamic>)
        .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CheckListModelToJson(CheckListModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'items': instance.items,
    };
