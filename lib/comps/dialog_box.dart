import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final Function()? onPressed;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
      title: Text("Add Task", style: TextStyle()),

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
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            controller.clear();
          },
          child: Text("Cancel"),
        ),
        TextButton(onPressed: onPressed, child: Text("Done")),
      ],
    );
  }
}
