import 'package:json_annotation/json_annotation.dart';
import 'package:trytulu/models/ChecklistModel.dart';

part 'TaskModel.g.dart';

@JsonSerializable()
class TaskModel {
  @JsonKey(name: 'task_name')
  String name;

  @JsonKey(name: 'task_status')
  int status;

  @JsonKey(name: 'task_location')
  String location;

  @JsonKey(name: 'task_type')
  String type;

  @JsonKey(name: 'start_time')
  DateTime startTime;

  @JsonKey(name: 'finishBy_time')
  DateTime finishByTime;

  @JsonKey(name: 'check_list')
  List<CheckListModel> checkList;

  TaskModel({
    required this.name,
    required this.status,
    required this.location,
    required this.type,
    required this.startTime,
    required this.finishByTime,
    required this.checkList,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
