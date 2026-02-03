import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/task_service.dart';
import '../models/task.dart';
import 'execution_page.dart';

class TaskBuffetPage extends StatefulWidget {
  final int maxMinutes;

  TaskBuffetPage({required this.maxMinutes});

  @override
  _TaskBuffetPageState createState() => _TaskBuffetPageState();
}

class _TaskBuffetPageState extends State<TaskBuffetPage> with SingleTickerProviderStateMixin {
  List<Task> tasks = [];
  final List<Task> skippedTasks = [];
  double dragOffset = 0.0;
  late AnimationController _controller;
  late Animation<double> _enterOffset;
  late Animation<double> _sideSlide;
  late Animation<double> _sideScale;

  @override
  void initState() {
    super.initState();
    final taskService = Provider.of<TaskService>(context, listen: false);
    tasks = taskService.filteredTasks(widget.maxMinutes);

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    _enterOffset = Tween<double>(begin: 80.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _sideSlide = Tween<double>(begin: 16.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _sideScale = Tween<double>(begin: 0.58, end: 0.6).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _controller.value = 1.0;
  }

  void removeTopTask() {
    setState(() {
      if (tasks.isNotEmpty) {
        skippedTasks.add(tasks.removeAt(0));
      }
    });
  }

  void animateNextToCenter() {
    _controller.reset();
    _controller.forward();
  }

  void swipeCard(double velocity) {
    if (velocity.abs() > 500) {
      if (velocity < 0) {
        _controller.forward().then((_) {
          removeTopTask();
          animateNextToCenter();
          setState(() => dragOffset = 0.0);
        });
      } else if (skippedTasks.isNotEmpty) {
        setState(() {
          tasks.insert(0, skippedTasks.removeLast());
          dragOffset = 0.0;
        });
        animateNextToCenter();
      } else {
        setState(() => dragOffset = 0.0);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Оберіть задачу')),
      body: Center(
        child: tasks.isEmpty
            ? Text('Немає задач під цей час. Можеш відпочити 🙂')
            : SizedBox(
                height: 400,
                width: 340,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    if (skippedTasks.isNotEmpty)
                      Positioned(
                        top: 40,
                        left: -190,
                        child: SizedBox(
                          width: 180,
                          child: AnimatedBuilder(
                            animation: _sideSlide,
                            builder: (_, __) {
                              return Transform.translate(
                                offset: Offset(-_sideSlide.value, 0),
                                child: Transform.scale(
                                  scale: _sideScale.value,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onHorizontalDragEnd: (details) {
                                      if (details.primaryVelocity != null &&
                                          details.primaryVelocity! > 300 &&
                                          skippedTasks.isNotEmpty) {
                                        setState(() {
                                          tasks.insert(0, skippedTasks.removeLast());
                                          dragOffset = 0.0;
                                        });
                                        animateNextToCenter();
                                      }
                                    },
                                    child: Opacity(
                                      opacity: 0.65,
                                      child: TaskCard(task: skippedTasks.last),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    Positioned(
                      top: 40,
                      right: -190,
                      child: SizedBox(
                        width: 180,
                        child: AnimatedBuilder(
                          animation: _sideSlide,
                          builder: (_, __) {
                            return Transform.translate(
                              offset: Offset(_sideSlide.value, 0),
                              child: Transform.scale(
                                scale: _sideScale.value,
                                child: IgnorePointer(
                                  child: Opacity(
                                    opacity: 0.65,
                                    child: tasks.length > 1
                                        ? TaskCard(task: tasks[1])
                                        : _SidePlaceholder(),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 30,
                      child: AnimatedBuilder(
                        animation: _enterOffset,
                        builder: (_, __) {
                          return GestureDetector(
                            onPanUpdate: (details) => setState(() => dragOffset += details.delta.dx),
                            onPanEnd: (details) => swipeCard(details.velocity.pixelsPerSecond.dx),
                            child: Transform.translate(
                              offset: Offset(dragOffset + _enterOffset.value, 0),
                              child: TaskCard(task: tasks.first),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _SidePlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        height: 200,
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        child: Text(
          'No more tasks',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final Task task;
  final Color? progressColor;
  final bool showStats;

  TaskCard({required this.task, this.progressColor, this.showStats = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 300,
        height: 200,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(task.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: task.targetValue == 0 ? 0 : task.progress / task.targetValue.toDouble(),
              minHeight: 10,
              backgroundColor: Colors.grey.shade300,
              color: progressColor ?? Colors.blue,
            ),
            if (showStats) ...[
              SizedBox(height: 8),
              _TaskStats(task: task),
            ],
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: task.subtasks
                    .map((s) => ListTile(
                          title: Text(s.title),
                          subtitle: Text('${s.estimatedTime} ${task.unitShortLabel} • ${s.energyLevel}'),
                        ))
                    .toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExecutionPage(task: task),
                    settings: RouteSettings(name: 'ExecutionPage'),
                  ),
                );
              },
              child: Text('Виконати'),
            ),
          ],
        ),
      ),
    );
  }
}

class _TaskStats extends StatelessWidget {
  final Task task;

  const _TaskStats({required this.task});

  @override
  Widget build(BuildContext context) {
    final target = task.targetValue;
    final progress = task.progress;
    final ratio = target == 0 ? 0.0 : progress / target;
    final percent = (ratio * 100).clamp(0.0, 100.0).toStringAsFixed(0);
    final remaining = (target - progress).clamp(0, target);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$progress / $target ${task.unitShortLabel} ($percent%)',
          style: TextStyle(fontSize: 12),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Left: $remaining ${task.unitShortLabel}',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              'Sessions: ${task.sessionCount}',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
