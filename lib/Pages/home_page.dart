import 'package:flutter/material.dart';
import 'package:provider_learn/Pages/my_fab.dart';
import 'package:provider_learn/services/firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> tasks = []; // task + isDone
  final TextEditingController taskController =
      TextEditingController(); //TextEditingController to get text from TextField
  final FirestoreService firestoreService = FirestoreService();
  void addTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text("Add Task"),

          content: TextField(
            controller: taskController,
            decoration: InputDecoration(
              hintText: "Enter you Task",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1)),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                taskController.clear();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                firestoreService.addTasks(taskController.text);
                setState(() {
                  tasks.add({
                    "title": taskController.text.trim(),
                    "isDone": false,
                  });
                });
                Navigator.pop(context);
                taskController.clear();
              },
              child: Text("Done"),
            ),
          ],
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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),

      floatingActionButton: MyFab(onPressed: addTask),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            leading: Checkbox(
              value: task["isDone"],
              onChanged: (value) {
                setState(() {
                  task["isDone"] = value!;
                });
              },
            ),
            title: Text(
              '${task["title"]}',
              style: TextStyle(
                decoration: task["isDone"]
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  tasks.removeAt(index);
                });
              },
              icon: Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
