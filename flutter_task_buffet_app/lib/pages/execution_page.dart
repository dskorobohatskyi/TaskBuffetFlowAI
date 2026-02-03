import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
  int _selectedPages = 0;
  bool _showPagePicker = false;
  late FixedExtentScrollController _pagePickerController;
  StopwatchController? _execStopwatch;

  @override
  void initState() {
    super.initState();
    _pagePickerController = FixedExtentScrollController(initialItem: _selectedPages);
    if (widget.task.unitType == UnitType.executions) {
      _execStopwatch = StopwatchController()..start();
    }
  }

  @override
  void dispose() {
    _pagePickerController.dispose();
    _execStopwatch?.dispose();
    super.dispose();
  }

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
                if (widget.task.unitType == UnitType.executions && _execStopwatch != null) ...[
                  AnimatedBuilder(
                    animation: _execStopwatch!,
                    builder: (_, __) {
                      return Text(
                        _execStopwatch!.formattedTime,
                        style: TextStyle(fontSize: 32),
                      );
                    },
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This time is only for you, no metrics kept',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _execStopwatch!.toggle,
                    child: Text('pause'),
                  ),
                  SizedBox(height: 12),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.task.unitType == UnitType.pages) ...[
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
                      SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          setState(() => _showPagePicker = !_showPagePicker);
                        },
                        child: Text('Add N Pages'),
                      ),
                    ] else
                      ElevatedButton(
                        onPressed: () {
                          setState(() => _sessionCount += 1);
                          Provider.of<TaskService>(context, listen: false)
                              .updateProgress(widget.task, 1);
                          if (widget.task.unitType == UnitType.executions) {
                            _goToCompletion(context, _sessionCount);
                            return;
                          }
                          if (widget.task.progress >= widget.task.targetValue) {
                            _goToCompletion(context, _sessionCount);
                          }
                        },
                        child: Text(widget.task.unitType == UnitType.executions ? 'done' : '+1'),
                      ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => _finishTask(context, _sessionCount),
                      child: Text(widget.task.unitType == UnitType.executions ? 'cancel' : 'stop'),
                    ),
                  ],
                ),
                if (widget.task.unitType == UnitType.pages && _showPagePicker) ...[
                  SizedBox(height: 16),
                  SizedBox(
                    height: 140,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onVerticalDragUpdate: (details) {
                        _pagePickerController.position.moveTo(
                          _pagePickerController.position.pixels - details.delta.dy,
                        );
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: CupertinoPicker(
                              itemExtent: 32,
                              scrollController: _pagePickerController,
                              onSelectedItemChanged: (value) {
                                setState(() => _selectedPages = value);
                              },
                              children: List.generate(
                                widget.task.targetValue + 1,
                                (i) => Center(child: Text('$i')),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _selectedPages == 0
                        ? null
                        : () {
                            setState(() => _sessionCount += _selectedPages);
                            Provider.of<TaskService>(context, listen: false)
                                .updateProgress(widget.task, _selectedPages);
                            if (widget.task.progress >= widget.task.targetValue) {
                              _goToCompletion(context, _sessionCount);
                            }
                            setState(() => _showPagePicker = false);
                          },
                    child: Text('Confirm $_selectedPages Pages'),
                  ),
                ],
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
