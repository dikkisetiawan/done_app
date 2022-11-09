// import 'package:done_list/bloc/cubit/toggle_task_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../models/task_model.dart';
// import '../../shared/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// class Task extends StatelessWidget {
//   final TaskModel task;
//   final Animation<double> animation;
//   final Function onClicked;
//   const Task(
//       {Key? key,
//       required this.task,
//       required this.animation,
//       required this.onClicked})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: animation,
//       child: Slidable(
//         startActionPane: ActionPane(motion: const ScrollMotion(), children: [
//           SlidableAction(
//             backgroundColor: kBlueColor,
//             onPressed: (context) {},
//             icon: Icons.delete_outline_rounded,
//           )
//         ]),
//         child: Padding(
//           padding: const EdgeInsets.only(bottom: 10.0),
//           child: Material(
//             color: kSecondaryColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(25),
//             ),
//             child: ListTile(
//               textColor: kDangerColor,
//               contentPadding: const EdgeInsets.all(10.0),
//               selectedColor: kWhiteColor,
//               hoverColor: kWhiteColor,
//               leading: IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.radio_button_unchecked_outlined,
//                     color:
//                         task.area == Area.personal ? kPinkColor : kPrimaryColor,
//                   )),
//               title: Text('${task.title} ',
//                   style: whiteTextStyle.copyWith(
//                       fontSize: 14.0, fontWeight: FontWeight.bold)),
//               trailing: BlocBuilder<ToggleTaskCubit, bool>(
//                 builder: (context, state) {
//                   return GestureDetector(
//                     onTap: () {
//                       context.read<ToggleTaskCubit>().toggleWidget();
//                     },
//                     child: state
//                         ? Row(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 task.priority?.value != null
//                                     ? 'L${task.priority?.value}    '
//                                     : '',
//                                 style: greyTextStyle.copyWith(fontSize: 12.0),
//                               ),
//                               task.notes != null
//                                   ? Icon(
//                                       Icons.notes_outlined,
//                                       color: kPrimaryColor,
//                                     )
//                                   : const SizedBox()
//                             ],
//                           )
//                         : Row(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 '${task.duration}    ',
//                                 style: greyTextStyle.copyWith(fontSize: 12.0),
//                               ),
//                               task.mood?.value != null
//                                   ? Icon(
//                                       task.mood?.value,
//                                       color: kPrimaryColor,
//                                     )
//                                   : const SizedBox()
//                             ],
//                           ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
