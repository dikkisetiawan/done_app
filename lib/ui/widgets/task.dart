import 'package:done_list/models/task_model.dart';
import '../../shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Task extends StatefulWidget {
  final TaskModel task;
  final Animation<double> animation;
  final Function onClicked;

  Task(
      {Key? key,
      required this.task,
      required this.animation,
      required this.onClicked})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.animation,
      child: Slidable(
        startActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            backgroundColor: kBlueColor,
            onPressed: (context) {},
            icon: Icons.delete_outline_rounded,
          )
        ]),
        child: ListTile(
          hoverColor: kWhiteColor,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.radio_button_unchecked_outlined,
                color: kPrimaryColor,
              )),
          title: Text('${widget.task.title} ',
              style: whiteTextStyle.copyWith(
                  fontSize: 14.0, fontWeight: FontWeight.bold)),
          trailing: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '1h   ',
                  style: greyTextStyle.copyWith(fontSize: 12.0),
                ),
                Icon(
                  Icons.emoji_emotions_rounded,
                  color: kPrimaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
