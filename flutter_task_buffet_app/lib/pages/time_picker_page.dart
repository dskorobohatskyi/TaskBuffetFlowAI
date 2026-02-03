import 'package:flutter/material.dart';
import 'task_buffet_page.dart';
import '../models/task.dart';

class TimePickerPage extends StatelessWidget {
  final List<int> times = [10, 15, 30, 60];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('How much time do you have now?')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...times.map((t) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TaskBuffetPage(maxMinutes: t),
                          settings: RouteSettings(name: 'TaskBuffetPage'),
                        ),
                      );
                    },
                    child: Text('$t ${UnitType.minutes.shortLabel}'),
                  ),
                )),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TaskBuffetPage(maxMinutes: 999),
                    settings: RouteSettings(name: 'TaskBuffetPage'),
                  ),
                );
              },
              child: Text('Give me anything'),
            ),
          ],
        ),
      ),
    );
  }
}
