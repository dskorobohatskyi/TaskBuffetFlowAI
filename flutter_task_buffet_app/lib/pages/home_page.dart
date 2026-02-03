import 'package:flutter/material.dart';
import 'time_picker_page.dart';
import 'create_task_page.dart';
import 'progress_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Buffet')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Привіт! Сьогодні можна обрати час для задач.', textAlign: TextAlign.center),
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
        ],
      ),
    );
  }
}

