// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaskModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return TaskModel(
    name: json['task_name'] as String,
    status: json['task_status'] as int,
    location: json['task_location'] as String,
    type: json['task_type'] as String,
    startTime: DateTime.parse(json['start_time'] as String),
    finishByTime: DateTime.parse(json['finishBy_time'] as String),
    checkList: (json['check_list'] as List<dynamic>)
        .map((e) => CheckListModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'task_name': instance.name,
      'task_status': instance.status,
      'task_location': instance.location,
      'task_type': instance.type,
      'start_time': instance.startTime.toIso8601String(),
      'finishBy_time': instance.finishByTime.toIso8601String(),
      'check_list': instance.checkList,
    };
