import 'package:flutter/material.dart';

class MyFab extends StatelessWidget {
  final VoidCallback onPressed;
  const MyFab({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Color(0xff03045e),
      child: Icon(Icons.add),
    );
  }
}
