import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/providers/font_provider.dart';

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
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: value ? TextDecoration.lineThrough : TextDecoration.none,
          fontSize: fontProvider,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: Checkbox(value: value, onChanged: onChanged),
      trailing: IconButton(icon: Icon(Icons.delete), onPressed: onPressed),
    );
  }
}
