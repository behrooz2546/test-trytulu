import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trytulu/models/TaskModel.dart';
import 'package:trytulu/services/TaskService.dart';

abstract class TaskRepository {
  Future<List<TaskModel>?> fetchTasks(BuildContext context);
}

class ApiTaskRepository implements TaskRepository {
  @override
  Future<List<TaskModel>?> fetchTasks(BuildContext context) async {
    var taskService = Provider.of<ChopperClient>(context, listen: false)
        .getService<TaskService>();
    try {
      var response = await taskService.getTasks();
      if (response.isSuccessful) {
        final List<TaskModel> tasks = (response.body as List<dynamic>)
            .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return tasks;
      } else {
        final snackBar = SnackBar(content: Text(response.error.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return null;
      }
    } catch (e) {
      print(e);
      final snackBar = SnackBar(content: Text("No Internet Connection"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return null;
    }
  }
}
