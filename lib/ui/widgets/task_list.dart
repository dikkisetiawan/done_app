// import 'package:done_list/services/all_task.dart';
// import 'package:done_list/ui/widgets/task.dart';
// import 'package:flutter/material.dart';
// import '../../models/task_model.dart';
// import '../../shared/theme.dart';

// class TaskList extends StatelessWidget {
//   var textFieldController = TextEditingController();
//   TaskList({super.key});

//   //create task input field
//   Widget taskInputField() {
//     return ListTile(
//       leading: IconButton(
//           onPressed: () {},
//           icon: Icon(
//             Icons.radio_button_unchecked_outlined,
//             color: kPrimaryColor,
//           )),
//       title: TextField(
//         controller: textFieldController,
//         onSubmitted: (value) {
//           textFieldController.clear();
//           //insertTodo(nextTodoIndex++, TaskItem(title: value));
//         },
//         cursorColor: kPrimaryColor,
//         style: whiteTextStyle,
//         decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: 'What have you done today?',
//             hintStyle: greyTextStyle.copyWith(fontSize: 14),
//             counterStyle: greyTextStyle.copyWith(fontSize: 14)),
//       ),
//     );
//   }

//   Widget buildTask(TaskModel task, int index, Animation<double> animation) =>
//       Task(
//         task: task,
//         animation: animation,
//         onClicked: () {},
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Column(
//         children: [
//           AnimatedList(
//             padding: const EdgeInsets.only(top: 5),
//             physics: const BouncingScrollPhysics(),
//             shrinkWrap: true, //mandatory
//             initialItemCount: AllTask().getAllTask.length,
//             itemBuilder: (context, index, animation) =>
//                 buildTask(AllTask().getAllTask[index], index, animation),
//           ),
//           taskInputField(),
//           const SizedBox(height: 300)
//         ],
//       ),
//     );
//   }
// }
