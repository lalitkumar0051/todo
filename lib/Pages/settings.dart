import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/font_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    var fontProvider = Provider.of<FontProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Text("Font Size"),
              trailing: Text(
                fontProvider.fontSize == 12
                    ? "Small"
                    : fontProvider.fontSize == 16
                    ? "Medium"
                    : "Large",
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Select Font Size"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text("Small"),
                            onTap: () {
                              context.read<FontProvider>().setSmall();

                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text("Medium"),
                            onTap: () {
                              context.read<FontProvider>().setMedium();

                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text("Large"),
                            onTap: () {
                              context.read<FontProvider>().setLarge();

                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text("Sort"),
              trailing: Text("By Date"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Select Sort Order"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text("By Date"),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text("By Name"),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text("Layout"),
              trailing: Text("List View"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Select Layout"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text("List View"),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text("Grid View"),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
