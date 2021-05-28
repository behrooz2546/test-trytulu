part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TaskEvent {
  const LoadTasks();
}

class LoadError extends TaskEvent {
  final String error;

  const LoadError({required this.error});

  @override
  List<Object> get props => [error];
}
