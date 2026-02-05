import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/task_service.dart';
import '../models/task.dart';
import 'execution_page.dart';
import 'link_selection_page.dart';

class TaskBuffetPage extends StatefulWidget {
  final int maxMinutes;

  TaskBuffetPage({required this.maxMinutes});

  @override
  _TaskBuffetPageState createState() => _TaskBuffetPageState();
}

class _TaskBuffetPageState extends State<TaskBuffetPage>
    with SingleTickerProviderStateMixin {
  final List<Task> skippedTasks = [];
  double dragOffset = 0.0;
  late AnimationController _controller;
  late Animation<double> _enterOffset;
  late Animation<double> _sideSlide;
  late Animation<double> _sideScale;

  @override
  void initState() {
    super.initState();
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

  void removeTopTask(Task task) {
    setState(() {
      if (skippedTasks.every((t) => t.id != task.id)) {
        skippedTasks.add(task);
      }
    });
  }

  void animateNextToCenter() {
    _controller.reset();
    _controller.forward();
  }

  void swipeCard(double velocity, Task currentTask) {
    if (velocity.abs() > 500) {
      if (velocity < 0) {
        _controller.forward().then((_) {
          removeTopTask(currentTask);
          animateNextToCenter();
          setState(() => dragOffset = 0.0);
        });
      } else if (skippedTasks.isNotEmpty) {
        setState(() {
          skippedTasks.removeLast();
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

  CardLayoutParams constructLayoutParamsForCards(BoxConstraints constraints) {
    final screenWidth = constraints.maxWidth;
    final cardWidth = (screenWidth * 0.78).clamp(240.0, 320.0);
    final cardHeight = 200.0;
    final sideWidth = cardWidth * 0.75;
    final peek = cardWidth * 0.4;
    final leftPeekX = -(sideWidth - peek);
    final rightPeekX = -(sideWidth - peek);
    final centerLeft = (screenWidth - cardWidth) / 2;

    return CardLayoutParams(
      screenWidth: screenWidth,
      cardWidth: cardWidth,
      cardHeight: cardHeight,
      sideWidth: sideWidth,
      leftPeekX: leftPeekX,
      rightPeekX: rightPeekX,
      centerLeft: centerLeft,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose a task')),
      body: Consumer<TaskService>(
        builder: (context, service, __) {
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
          final available = service.filteredTasks(widget.maxMinutes);
          final availableById = {
            for (final t in available) t.id: t,
          };
          final skippedIds = skippedTasks.map((t) => t.id).toSet();
          final visible = available.where((t) => !skippedIds.contains(t.id)).toList();
          final topTask = visible.isNotEmpty ? visible.first : null;
          final nextTask = visible.length > 1 ? visible[1] : null;
          final lastSkipped =
              skippedTasks.isNotEmpty ? (availableById[skippedTasks.last.id] ?? skippedTasks.last) : null;

          return Center(
            child: visible.isEmpty
            ? (skippedTasks.isNotEmpty
                ? LayoutBuilder(
                    builder: (context, constraints) {
                      final layout = constructLayoutParamsForCards(constraints);

                      return SizedBox(
                        height: 420,
                        width: layout.screenWidth,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: 40,
                              left: layout.centerLeft,
                              child: Column(
                                children: [
                                  _SidePlaceholder(),
                                  SizedBox(height: 12),
                                  Text(
                                    'Swipe left to return a task',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 40,
                              left: layout.leftPeekX,
                              child: SizedBox(
                                width: layout.sideWidth,
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
                                                skippedTasks.removeLast();
                                                dragOffset = 0.0;
                                              });
                                              animateNextToCenter();
                                            }
                                          },
                                          child: Opacity(
                                            opacity: 0.65,
                                            child: lastSkipped == null
                                                ? _SidePlaceholder()
                                                : TaskCard(
                                                    task: lastSkipped,
                                                    showStats: true,
                                                    width: layout.cardWidth,
                                                    height: layout.cardHeight,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Text('No tasks for this time. You can rest.'))
            : LayoutBuilder(
                builder: (context, constraints) {
                  final layout = constructLayoutParamsForCards(constraints);

                  return SizedBox(
                    height: 400,
                    width: layout.screenWidth,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        if (skippedTasks.isNotEmpty)
                          Positioned(
                            top: 40,
                            left: layout.leftPeekX,
                            child: SizedBox(
                              width: layout.sideWidth,
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
                                              skippedTasks.removeLast();
                                              dragOffset = 0.0;
                                            });
                                            animateNextToCenter();
                                          }
                                        },
                                        child: Opacity(
                                          opacity: 0.65,
                                          child: lastSkipped == null
                                              ? _SidePlaceholder()
                                              : TaskCard(
                                                  task: lastSkipped,
                                                  showStats: true,
                                                  width: layout.cardWidth,
                                                  height: layout.cardHeight,
                                                ),
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
                          right: layout.rightPeekX,
                          child: SizedBox(
                            width: layout.sideWidth,
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
                                        child: nextTask != null
                                            ? TaskCard(
                                                task: nextTask,
                                                showStats: true,
                                                width: layout.cardWidth,
                                                height: layout.cardHeight,
                                              )
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
                          left: layout.centerLeft,
                          child: AnimatedBuilder(
                            animation: _enterOffset,
                            builder: (_, __) {
                              if (topTask == null) {
                                return const SizedBox.shrink();
                              }
                              return GestureDetector(
                                onPanUpdate: (details) =>
                                    setState(() => dragOffset += details.delta.dx),
                                onPanEnd: (details) =>
                                    swipeCard(details.velocity.pixelsPerSecond.dx, topTask),
                                child: Transform.translate(
                                  offset: Offset(dragOffset + _enterOffset.value, 0),
                                  child: TaskCard(
                                    task: topTask,
                                    showStats: true,
                                    width: layout.cardWidth,
                                    height: layout.cardHeight,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
          );
        },
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
  final double? width;
  final double? height;

  TaskCard({
    required this.task,
    this.progressColor,
    this.showStats = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: width ?? 300,
        height: height ?? 200,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(task.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: task.progressRatio,
              minHeight: 10,
              backgroundColor: Colors.grey.shade300,
              color: progressColor ?? Colors.blue,
            ),
            if (showStats) ...[
              SizedBox(height: 8),
              _TaskStats(task: task),
            ],
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  task.linkCollectionId != null || task.unitType == UnitType.links
                      ? MaterialPageRoute(
                          builder: (_) => LinkSelectionPage(task: task),
                          settings: RouteSettings(name: 'LinkSelectionPage'),
                        )
                      : MaterialPageRoute(
                          builder: (_) => ExecutionPage(task: task),
                          settings: RouteSettings(name: 'ExecutionPage'),
                        ),
                );
              },
              child: Text(
                task.linkCollectionId != null || task.unitType == UnitType.links
                    ? 'Choose link'
                    : 'Execute',
              ),
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
    final percent = (task.progressRatio * 100).clamp(0.0, 100.0).toStringAsFixed(0);
    final remaining = (target - progress).clamp(0, target);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '$progress / $target ${task.unitShortLabel} ($percent%)',
            style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Left: $remaining ${task.unitShortLabel}',
              style: TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Sessions: ${task.sessionCount}',
              style: TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}

class CardLayoutParams {
  final double screenWidth;
  final double cardWidth;
  final double cardHeight;
  final double sideWidth;
  final double leftPeekX;
  final double rightPeekX;
  final double centerLeft;

  const CardLayoutParams({
    required this.screenWidth,
    required this.cardWidth,
    required this.cardHeight,
    required this.sideWidth,
    required this.leftPeekX,
    required this.rightPeekX,
    required this.centerLeft,
  });
}
