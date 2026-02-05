import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/task_service.dart';
import 'task_buffet_page.dart';

class ProgressPage extends StatelessWidget {
  Color _progressColor(double ratio) {
    final clamped = ratio.clamp(0.0, 1.0);
    return Color.lerp(Colors.red, Colors.green, clamped) ?? Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Progress')),
      body: Consumer<TaskService>(
        builder: (_, service, __) {
          if (!service.isReady) {
            return const Center(child: CircularProgressIndicator());
          }
          if (service.loadError != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Failed to load data. ${service.loadError}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          final tasks = service.allTasks;
          if (tasks.isEmpty) {
            return Center(child: Text('No tasks yet'));
          }

          return ListView.separated(
            padding: EdgeInsets.all(16),
            itemCount: tasks.length,
            separatorBuilder: (_, __) => SizedBox(height: 16),
            itemBuilder: (_, index) {
              final task = tasks[index];
              final ratio = task.progressRatio;
              return Center(
                child: TaskCard(
                  task: task,
                  progressColor: _progressColor(ratio),
                  showStats: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
