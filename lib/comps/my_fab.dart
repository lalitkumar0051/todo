import 'package:flutter/material.dart';

class MyFab extends StatelessWidget {
  final VoidCallback onPressed;
  const MyFab({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.amber,
      foregroundColor: Colors.black,
      child: Icon(Icons.add),
    );
  }
}
