import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider_learn/comps/my_fab.dart';
import 'package:provider_learn/Pages/settings.dart';
import 'package:provider_learn/comps/dialog_box.dart';
import 'package:provider_learn/comps/todo_tile.dart';
import 'package:provider_learn/data/database.dart';

class HomeScreen extends StatefulWidget {
  final String title = "Todo App";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _mybox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();
  @override
  void initState() {
    if (_mybox.get("TASKS") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // final List<Map<String, dynamic>> tasks = []; // task + isDone
  final _taskController =
      TextEditingController(); //TextEditingController to get text from TextField

  void addTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _taskController,
          onCancel: () {
            Navigator.pop(context);
            _taskController.clear();
          },
          onDone: () {
            setState(() {
              db.tasks.add({
                "title": _taskController.text.trim(),
                "isDone": false,
              });
            });
            Navigator.pop(context);
            db.updateData();
          },
        );
      },
    ).then((_) {
      _taskController.clear();
    });
  }

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.tasks[index]["isDone"] = value;
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[400],
        title: const Text("Todo"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),

      floatingActionButton: MyFab(onPressed: addTask),
      body: ListView.builder(
        itemCount: db.tasks.length,
        itemBuilder: (context, index) {
          final task = db.tasks[index];
          return TodoTile(
            title: task["title"],
            value: task["isDone"],
            onChanged: (value) {
              checkBoxChanged(value, index);
            },
            onPressed: () {
              setState(() {
                db.tasks.removeAt(index);
              });
              db.updateData();
            },
          );
        },
      ),
    );
  }
}
