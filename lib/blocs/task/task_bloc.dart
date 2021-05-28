import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:trytulu/models/TaskModel.dart';
import 'package:trytulu/services/TaskRepository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;
  TaskBloc({required this.taskRepository}) : super(TaskLoading());

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if (event is LoadTasks) {
      yield* _mapLoadTasksToState(event);
    } else if (event is LoadError) {
      _mapLoadErrorToState(event);
    }
  }

  Stream<TaskState> _mapLoadTasksToState(LoadTasks event) async* {
    yield TaskLoading();
    var tasks = await taskRepository.fetchTasks();
    yield TaskLoaded(tasks: tasks ?? []);
  }

  Future<TaskState> _mapLoadErrorToState(LoadError event) async {
    return TaskNotLoaded();
  }
}
