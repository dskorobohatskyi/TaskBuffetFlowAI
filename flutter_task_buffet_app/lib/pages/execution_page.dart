import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../controllers/stopwatch_controller.dart';
import '../services/task_service.dart';
import 'completion_page.dart';

class ExecutionPage extends StatefulWidget {
  final Task task;

  ExecutionPage({required this.task});

  @override
  State<ExecutionPage> createState() => _ExecutionPageState();
}

class _ExecutionPageState extends State<ExecutionPage> {
  int _sessionCount = 0;

  void _finishTask(BuildContext context, int addValue) {
    final service = Provider.of<TaskService>(context, listen: false);
    if (widget.task.unitType == UnitType.minutes) {
      service.updateProgress(widget.task, addValue);
    }
    service.recordSession(widget.task, addValue);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => CompletionPage(task: widget.task, sessionValue: addValue),
        settings: RouteSettings(name: 'CompletionPage'),
      ),
    );
  }

  void _goToCompletion(BuildContext context, int sessionValue) {
    Provider.of<TaskService>(context, listen: false)
        .recordSession(widget.task, sessionValue);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => CompletionPage(task: widget.task, sessionValue: sessionValue),
        settings: RouteSettings(name: 'CompletionPage'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.task.unitType != UnitType.minutes) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.task.title)),
        body: Consumer<TaskService>(
          builder: (_, __, ___) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.task.progress} / ${widget.task.targetValue} ${widget.task.unitShortLabel}',
                  style: TextStyle(fontSize: 32),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() => _sessionCount += 1);
                        Provider.of<TaskService>(context, listen: false)
                            .updateProgress(widget.task, 1);
                        if (widget.task.progress >= widget.task.targetValue) {
                          _goToCompletion(context, _sessionCount);
                        }
                      },
                      child: Text('+1'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => _finishTask(context, _sessionCount),
                      child: Text('stop'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
    }

    return ChangeNotifierProvider(
      create: (_) => StopwatchController()..start(),
      child: Consumer<StopwatchController>(
        builder: (_, stopwatch, __) {
          return Scaffold(
            appBar: AppBar(title: Text(widget.task.title)),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(stopwatch.formattedTime, style: TextStyle(fontSize: 48)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: stopwatch.toggle, child: Text('pause')),
                    SizedBox(width: 20),
                    ElevatedButton(
                        onPressed: () {
                          stopwatch.finish();
                          final minutes = (stopwatch.seconds / 60).ceil();
                          _finishTask(context, minutes);
                        },
                        child: Text('stop')),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
