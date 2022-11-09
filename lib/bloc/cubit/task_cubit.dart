import 'package:bloc/bloc.dart';
import 'package:done_list/models/task_model.dart';
import 'package:done_list/services/task_service.dart';
import 'package:equatable/equatable.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  void createTask(TaskModel task) async {
    try {
      emit(TaskLoading());
      await TaskService().createTask(task);
      emit(TaskSuccess([]));
      print('success create task');
    } catch (e) {
      emit(TaskFailed(e.toString()));
      print(e);
    }
  }

  void fetchTasksByCurrentUser() async {
    try {
      emit(TaskLoading());

      List<TaskModel> tasks = await TaskService().fetchTasksByCurrentUser();

      emit(TaskSuccess(tasks));
      print('success fetch task');
    } catch (e) {
      emit(TaskFailed(e.toString()));
      print(e);
    }
  }

  void getTaskById(String id) async {
    try {
      emit(TaskLoading());

      TaskModel tasks = await TaskService().getTaskById(id);

      emit(TaskSuccess([tasks]));
    } catch (e) {
      emit(TaskFailed(e.toString()));
    }
  }

  void UpdateTaskById(TaskModel task) async {
    try {
      emit(TaskLoading());
      await TaskService().UpdateTaskById(task);
      emit(TaskSuccess([]));
    } catch (e) {
      emit(TaskFailed(e.toString()));
    }
  }

  void deleteTaskById(String id) async {
    try {
      emit(TaskLoading());

      await TaskService().deleteTaskById(id);

      emit(TaskSuccess([]));
    } catch (e) {
      emit(TaskFailed(e.toString()));
    }
  }
}
