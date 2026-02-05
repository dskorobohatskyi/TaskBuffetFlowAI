import 'package:flutter/material.dart';
import '../models/task.dart';
import '../models/link_collection.dart';
import 'dart:math';

class TaskService extends ChangeNotifier {
  final List<Task> _tasks = [];
  final List<LinkCollection> _linkCollections = [];
  bool _mockSeeded = false;

  TaskService();

  List<Task> get allTasks => List.unmodifiable(_tasks);
  List<LinkCollection> get allLinkCollections => List.unmodifiable(_linkCollections);

  LinkCollection? getLinkCollectionById(String id) {
    for (final c in _linkCollections) {
      if (c.id == id) return c;
    }
    return null;
  }

  void upsertLinkCollection(LinkCollection collection) {
    final index = _linkCollections.indexWhere((c) => c.id == collection.id);
    if (index >= 0) {
      _linkCollections[index] = collection;
    } else {
      _linkCollections.add(collection);
    }
    notifyListeners();
  }

  void toggleLinkDone(String collectionId, String linkId) {
    final index = _linkCollections.indexWhere((c) => c.id == collectionId);
    if (index < 0) return;
    final collection = _linkCollections[index];
    final updatedItems = collection.items.map((item) {
      if (item.id != linkId) return item;
      return item.copyWith(hasDone: !item.hasDone);
    }).toList();
    _linkCollections[index] = LinkCollection(
      id: collection.id,
      title: collection.title,
      items: updatedItems,
    );
    notifyListeners();
  }

  void removeLinkCollection(String id) {
    _linkCollections.removeWhere((c) => c.id == id);
    notifyListeners();
  }

  void seedMockData() {
    if (_mockSeeded) return;
    _mockSeeded = true;

    _linkCollections.add(
      LinkCollection(
        id: 'different_links',
        title: 'Reading Links',
        items: [
          LinkItem(
            id: 'l1',
            title: 'Deep Work summary',
            url: 'https://example.com/deep-work',
          ),
          LinkItem(
            id: 'l2',
            title: 'Codex tutorial',
            url: 'https://www.youtube.com/watch?v=px7XlbYgk7I',
          ),
          LinkItem(
            id: 'l3',
            title: 'Focus techniques',
            url: 'https://example.com/focus',
          ),
        ],
      ),
    );
    _tasks.addAll([
      Task(
        id: generateId(),
        title: 'Cleaning',
        unitType: UnitType.minutes,
        targetValue: 50,
        allowedSplits: [15, 20, 30],
      ),
      Task(
        id: generateId(),
        title: 'Read articles',
        unitType: UnitType.links,
        targetValue: 2,
        linkCollectionId: 'different_links',
        minRequiredMinutes: 10,
      ),
      Task(
        id: generateId(),
        title: 'train',
        unitType: UnitType.executions,
        targetValue: 3,
      ),
    ]);

    notifyListeners();
  }

  List<Task> filteredTasks(int maxMinutes) {
    return _tasks.where((t) {
      return t.fitsMinutes(maxMinutes);
    }).toList();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateProgress(Task task, int value) {
    task.progress += value;
    if (task.progress < 0) task.progress = 0;
    notifyListeners();
  }

  void applyProgress(Task task, int delta, {bool recordSession = false}) {
    updateProgress(task, delta);
    if (recordSession) {
      recordSessionForTask(task, delta);
    }
  }

  void recordSession(Task task, int sessionValue) {
    recordSessionForTask(task, sessionValue);
  }

  void recordSessionForTask(Task task, int sessionValue) {
    task.sessionCount += 1;
    task.lastSessionValue = sessionValue;
    notifyListeners();
  }

  void decrementSession(Task task) {
    if (task.sessionCount > 0) {
      task.sessionCount -= 1;
      notifyListeners();
    }
  }

  String generateId() {
    return Random().nextInt(100000).toString();
  }
}
