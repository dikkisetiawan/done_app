import 'package:bloc/bloc.dart';
import 'package:done_list/models/task_model.dart';
import 'package:done_list/services/task_service.dart';
import 'package:equatable/equatable.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  void createTask(TaskModel task) async {
    try {
      emit(FetchTaskLoading());
      await TaskService().createTask(task);
      emit(FetchAllTaskSuccess([]));
      print('success create task');
    } catch (e) {
      emit(FetchTaskFailed(e.toString()));
      print(e);
    }
  }

  void fetchTasksByCurrentUser() async {
    try {
      emit(FetchTaskLoading());

      List<TaskModel> tasks = await TaskService().fetchTasksByCurrentUser();

      emit(FetchAllTaskSuccess(tasks));
      print('success fetch task');
    } catch (e) {
      emit(FetchTaskFailed(e.toString()));
      print(e);
    }
  }

  void getTaskById(String id) async {
    try {
      emit(FetchTaskLoading());

      TaskModel task = await TaskService().fetchTaskById(id);

      emit(FetchTaskByIdSuccess(task));
    } catch (e) {
      emit(FetchTaskFailed(e.toString()));
    }
  }

  void UpdateTaskById(TaskModel task) async {
    try {
      emit(FetchTaskLoading());
      await TaskService().UpdateTaskById(task);
      emit(FetchAllTaskSuccess([]));
    } catch (e) {
      emit(FetchTaskFailed(e.toString()));
    }
  }

  void deleteTaskById(String id) async {
    try {
      emit(FetchTaskLoading());

      await TaskService().deleteTaskById(id);

      emit(FetchAllTaskSuccess([]));
    } catch (e) {
      emit(FetchTaskFailed(e.toString()));
    }
  }
}
