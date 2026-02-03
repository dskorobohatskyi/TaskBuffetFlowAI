import 'package:flutter/material.dart';
import 'time_picker_page.dart';
import 'create_task_page.dart';
import 'progress_page.dart';
import 'link_collections_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Buffet')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CreateTaskPage(),
                  settings: RouteSettings(name: 'CreateTaskPage'),
                ),
              );
            },
            child: const Text('Create new task'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TimePickerPage(),
                  settings: RouteSettings(name: 'TimePickerPage'),
                ),
              );
            },
            child: Text('Suggest me anything'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProgressPage(),
                  settings: RouteSettings(name: 'ProgressPage'),
                ),
              );
            },
            child: Text('Show my progress'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LinkCollectionsPage(),
                  settings: RouteSettings(name: 'LinkCollectionsPage'),
                ),
              );
            },
            child: Text('Manage links'),
          ),
          ],
        ),
      ),
    );
  }
}
