import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/font_provider.dart';

class TodoTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?) onChanged;
  final VoidCallback? onPressed;
  const TodoTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var fontProvider = context.watch<FontProvider>().fontSize;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
        tileColor: Colors.yellow[500],
        title: Text(
          title,
          style: TextStyle(
            decoration: value
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            fontSize: fontProvider,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.black,
        ),
        trailing: IconButton(icon: Icon(Icons.delete), onPressed: onPressed),
      ),
    );
  }
}
