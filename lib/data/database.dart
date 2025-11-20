import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List tasks = [];
  final _mybox = Hive.box('mybox');

  void createInitialData() {
    tasks = [
      {"title": "Welcome to your Todo App", "isDone": false},
      {"title": "Tap + button to add a new task", "isDone": false},
      {"title": "Tap the checkbox to mark as done", "isDone": false},
    ];
  }

  void loadData() {
    tasks = _mybox.get("TASKS");
  }

  void updateData() {
    _mybox.put("TASKS", tasks);
  }
}
