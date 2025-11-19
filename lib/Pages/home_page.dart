import 'package:flutter/material.dart';
import 'package:provider_learn/Pages/my_fab.dart';
import 'package:provider_learn/Pages/settings.dart';
import 'package:provider_learn/comps/dialog_box.dart';
import 'package:provider_learn/comps/todo_tile.dart';
import 'package:provider_learn/services/firestore.dart';

class HomeScreen extends StatefulWidget {
  final String title = "Todo App";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> tasks = []; // task + isDone
  final TextEditingController taskController = TextEditingController();
  final FirestoreService firestoreService = FirestoreService();

  void addTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: taskController,
          onPressed: () {
            setState(() {
              tasks.add({"title": taskController.text.trim(), "isDone": false});
            });
            Navigator.pop(context);
          },
        );
      },
    ).then((_) {
      taskController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcaf0f8),
      appBar: AppBar(
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
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TodoTile(
            title: task["title"],
            value: task["isDone"],
            onChanged: (value) {
              setState(() {
                task["isDone"] = value;
              });
            },
            onPressed: () {
              setState(() {
                tasks.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
