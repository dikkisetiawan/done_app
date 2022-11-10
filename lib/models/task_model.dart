import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum Status {
  open(Colors.cyan),
  done(Colors.green),
  automate(Colors.blue),
  delegate(Colors.orange),
  eliminate(Colors.red),
  procastinate(Colors.grey);

  const Status(this.color);
  final Color color;
}

enum Area {
  personal(Colors.cyan),
  secondArea(Colors.yellow);

  const Area(this.color);
  final Color color;
}

enum Mood {
  none(SizedBox(width: 20)),
  verySad(Icon(Icons.sentiment_very_dissatisfied, color: Color(0xffEB819C))),
  sad(Icon(Icons.sentiment_dissatisfied, color: Color(0xffF27D81))),
  neutral(Icon(Icons.sentiment_neutral, color: Color(0xff566CDC))),
  happy(Icon(Icons.sentiment_satisfied, color: Color(0xff8BD97B))),
  veryHappy(Icon(Icons.sentiment_very_satisfied, color: Color(0xffE1D773)));

  const Mood(this.icon);
  final Widget icon;
}

enum Priority {
  none(0),
  level1(1),
  level2(2),
  level3(3),
  level4(4),
  level5(5);

  const Priority(this.number);
  final int number;
}

class TaskModel extends Equatable {
  final String? id;
  final String title;
  late Status status;
  final DateTime? due;
  final String? duration;
  final Area area;
  final Mood? mood;
  final Priority? priority;

  TaskModel(
      {this.id,
      required this.title,
      required this.area,
      this.due,
      this.duration,
      this.status = Status.open,
      this.mood = Mood.none,
      this.priority = Priority.none});

  TaskModel copy(
          {String? id,
          String? title,
          Status? status,
          DateTime? due,
          String? duration,
          Area? area,
          Mood? mood,
          Priority? priority}) =>
      TaskModel(
          id: id ?? this.id,
          title: title ?? this.title,
          status: status ?? this.status,
          due: due ?? this.due,
          duration: duration ?? this.duration,
          area: area ?? this.area,
          mood: mood ?? this.mood,
          priority: priority ?? this.priority);

  Map<String, dynamic> toJson() => {
        'title': title,
        'status': status.name.toString(),
        'due': due,
        'duration': duration,
        'area': area.name.toString(),
        'mood': mood!.name.toString(),
        'priority': priority!.name.toString(),
      };

  factory TaskModel.fromJson(String id, Map<String, dynamic> json) => TaskModel(
      id: id,
      title: json['title'] as String,
      status: Status.values.byName(json['status']),
      due: DateTime.tryParse(json['due']),
      duration: json['duration'],
      area: Area.values.byName(json['area']),
      mood: Mood.values.byName(json['mood']),
      priority: Priority.values.byName(json['priority']));

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, title, status, due, duration, area, mood, priority];
}

//enum serialize deserialize https://stackoverflow.com/a/68724981