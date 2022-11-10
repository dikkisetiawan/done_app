part of 'task_cubit.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class FetchTaskLoading extends TaskState {}

class FetchAllTaskSuccess extends TaskState {
  final List<TaskModel> tasks;

  FetchAllTaskSuccess(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class FetchTaskByIdSuccess extends TaskState {
  final TaskModel task;

  FetchTaskByIdSuccess(this.task);

  @override
  List<Object> get props => [task];
}

class FetchTaskFailed extends TaskState {
  final String error;

  const FetchTaskFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
