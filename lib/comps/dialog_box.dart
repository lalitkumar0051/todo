import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final Function() onCancel;
  final Function() onDone;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
      title: Text("Add Task"),

      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Enter you Task",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(1)),
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: onCancel, child: Text("Cancel")),
        TextButton(onPressed: onDone, child: Text("Done")),
      ],
    );
  }
}
