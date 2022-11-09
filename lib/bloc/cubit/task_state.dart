part of 'task_cubit.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskSuccess extends TaskState {
  final List<TaskModel> tasks;

  TaskSuccess(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class TaskFailed extends TaskState {
  final String error;

  const TaskFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
