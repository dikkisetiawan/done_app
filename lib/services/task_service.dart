import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/task_model.dart';

class TaskService {
  CollectionReference _taskReference =
      FirebaseFirestore.instance.collection('tasks');

  User? user = FirebaseAuth.instance.currentUser;

//create
  Future<void> createTask(TaskModel task) async {
    try {
      _taskReference.add({
        'uid': user!.uid, //return null if not logged in
        'title': task.title,
        'area': task.area.name,
        'status': task.status.name,
        'duration': task.duration,
        'due': task.due.toString(),
        'mood': task.mood!.name,
        'priority': task.priority!.name,
      });
    } catch (e) {
      throw e;
    }
  }

//read
  Future<List<TaskModel>> fetchTasksByCurrentUser() async {
    try {
      QuerySnapshot result = await _taskReference
          .where('uid', isEqualTo: user!.uid)
          .get(); //where uid current user

      List<TaskModel> tasks = result.docs.map(
        (e) {
          return TaskModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return tasks;
    } catch (e) {
      throw e;
    }
  }

//read by taskidd
  Future<TaskModel> fetchTaskById(String? id) async {
    try {
      DocumentSnapshot snapshot = await _taskReference.doc(id).get();
      return TaskModel(
          id: id,
          title: snapshot['title'] as String,
          area: Area.values.byName(snapshot['area']),
          status: Status.values.byName(snapshot['status']),
          duration: snapshot['duration'] as String,
          due: DateTime.tryParse(snapshot['due']),
          mood: Mood.values.byName(snapshot['mood']),
          priority: Priority.values.byName(snapshot['priority']));
    } catch (e) {
      throw e;
    }
  }

  //update tasks by id
  Future<void> UpdateTaskById(TaskModel task) async {
    try {
      _taskReference.doc(task.id).update({
        'title': task.title,
        'area': task.area.name.toString(),
        'status': task.status.name.toString(),
        'duration': task.duration,
        'due': task.due.toString(),
        'mood': task.mood!.name.toString(),
        'priority': task.priority!.name.toString(),
      });
    } catch (e) {
      throw e;
    }
  }

  //delete
  Future<void> deleteTaskById(String id) async {
    try {
      await _taskReference.doc(id).delete();
    } catch (e) {
      throw e;
    }
  }
}
