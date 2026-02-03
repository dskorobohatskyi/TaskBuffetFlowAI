enum UnitType { minutes, executions, pages }

extension UnitTypeLabel on UnitType {
  String get shortLabel {
    switch (this) {
      case UnitType.minutes:
        return "mins";
      case UnitType.executions:
        return "(times)";
      case UnitType.pages:
        return "pages";
    }
  }
}

class Subtask {
  String title;
  int estimatedTime; // in minutes or count
  String energyLevel; // "low", "medium", "high"

  Subtask({
    required this.title,
    required this.estimatedTime,
    this.energyLevel = "medium",
  });
}

class Task {
  String id;
  String title;
  UnitType unitType;
  int targetValue;
  int progress;
  int sessionCount;
  int lastSessionValue;
  bool isOneTime;
  String energyLevel;
  List<Subtask> subtasks;
  List<int> allowedSplits;

  Task({
    required this.id,
    required this.title,
    required this.unitType,
    required this.targetValue,
    this.progress = 0,
    this.sessionCount = 0,
    this.lastSessionValue = 0,
    this.isOneTime = false,
    this.energyLevel = "medium",
    this.subtasks = const [],
    this.allowedSplits = const [],
  });

  String get unitShortLabel {
    return unitType.shortLabel;
  }
}
