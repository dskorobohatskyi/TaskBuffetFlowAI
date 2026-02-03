import 'package:flutter/material.dart';
import '../models/task.dart';
import 'dart:math';

class TaskService extends ChangeNotifier {
  final List<Task> _tasks = [];

  TaskService() {
    _tasks.addAll([
      Task(
        id: generateId(),
        title: 'Cleaning',
        unitType: UnitType.minutes,
        targetValue: 50,
        allowedSplits: [ 15, 20, 30],
      ),
      Task(
        id: generateId(),
        title: 'Reading',
        unitType: UnitType.pages,
        targetValue: 30,
      ),
      Task(
        id: generateId(),
        title: 'train',
        unitType: UnitType.executions,
        targetValue: 3,
      ),
    ]);
  }

  List<Task> get allTasks => List.unmodifiable(_tasks);

  List<Task> filteredTasks(int maxMinutes) {
    return _tasks.where((t) {
      if (t.unitType == UnitType.minutes) {
        return t.allowedSplits.any((s) => s <= maxMinutes);
      }
      if (t.unitType == UnitType.executions) {
        return (t.minRequiredMinutes ?? 0) <= maxMinutes;
      }
      return true;
    }).toList();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateProgress(Task task, int value) {
    task.progress += value;
    notifyListeners();
  }

  void recordSession(Task task, int sessionValue) {
    task.sessionCount += 1;
    task.lastSessionValue = sessionValue;
    notifyListeners();
  }

  String generateId() {
    return Random().nextInt(100000).toString();
  }
}
