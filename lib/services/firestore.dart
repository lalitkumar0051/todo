import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of tasks
  final CollectionReference tasks = FirebaseFirestore.instance.collection(
    "tasks",
  );
  // create: Add new task
  Future<void> addTasks(String task) {
    return tasks.add({'title': task, 'isDone': false});
  }
  // read: get tasks

  // update: update tasks

  //delete: delete tasks
}
