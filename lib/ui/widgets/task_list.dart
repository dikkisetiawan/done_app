import '../../bloc/cubit/task_cubit.dart';

import '../../models/task_model.dart';
import '/shared/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'task.dart';

class TaskList extends StatefulWidget {
  TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final taskListKey = GlobalKey();

  @override
  void initState() {
    //load existing tasks when logged in
    context.read<TaskCubit>().fetchTasksByCurrentUser();
    super.initState();
  }

  Widget buildTask(TaskModel task, int index, Animation<double> animation) =>
      Task(
        task: task,
        animation: animation,
        onClicked: (value) {
          print('clicked');
        },
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius:
              const BorderRadius.all(Radius.circular(defaultCircular)),
        ),
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            if (state is TaskLoading) {
              return CircularProgressIndicator();
            } else if (state is TaskSuccess) {
              if (state.tasks.length == 0) {
                return Text('Kamu belum memiliki Task');
              } else {
                return AnimatedList(
                    key: taskListKey,
                    padding: EdgeInsets.only(top: 0),
                    physics: BouncingScrollPhysics(),
                    initialItemCount: state.tasks.length,
                    itemBuilder: (context, index, animation) {
                      return Center(
                        child: buildTask(state.tasks[index], index, animation),
                      );
                    });
              }
            }

            return Center(
              child: Text(
                state.toString(),
                style: whiteTextStyle,
              ),
            );
          },
        ),
      ),
    );
  }
}
