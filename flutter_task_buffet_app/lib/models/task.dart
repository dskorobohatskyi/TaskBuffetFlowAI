enum UnitType { minutes, executions, pages, links }

extension UnitTypeLabel on UnitType {
  bool get isTimeBased => this == UnitType.minutes;

  bool get isCountBased => !isTimeBased;

  bool get isLinkTask => this == UnitType.links;

  String get shortLabel {
    switch (this) {
      case UnitType.minutes:
        return "mins";
      case UnitType.executions:
        return "(times)";
      case UnitType.pages:
        return "pages";
      case UnitType.links:
        return "links";
    }
  }

  String get displayName {
    switch (this) {
      case UnitType.minutes:
        return "Time (minutes)";
      case UnitType.executions:
        return "Executions (times)";
      case UnitType.pages:
        return "Pages";
      case UnitType.links:
        return "Links";
    }
  }

  String get targetLabel {
    switch (this) {
      case UnitType.minutes:
        return "Target minutes";
      case UnitType.executions:
        return "Target executions";
      case UnitType.pages:
        return "Target pages";
      case UnitType.links:
        return "Target links";
    }
  }

  TaskInputSpec get inputSpec {
    switch (this) {
      case UnitType.minutes:
        return TaskInputSpec(needsTarget: true, needsSplits: true);
      case UnitType.executions:
        return TaskInputSpec(needsTarget: true, needsMinMinutes: true);
      case UnitType.pages:
        return TaskInputSpec(needsTarget: true);
      case UnitType.links:
        return TaskInputSpec(needsTarget: true, needsMinMinutes: true, needsLinkCollection: true);
    }
  }
}

class Task {
  String id;
  String title;
  UnitType unitType;
  int targetValue;
  int progress;
  int sessionCount;
  int lastSessionValue;
  int? minRequiredMinutes;
  String? linkCollectionId;
  bool isOneTime;
  String energyLevel;
  List<int> allowedSplits;

  Task({
    required this.id,
    required this.title,
    required this.unitType,
    required this.targetValue,
    this.progress = 0,
    this.sessionCount = 0,
    this.lastSessionValue = 0,
    this.minRequiredMinutes,
    this.linkCollectionId,
    this.isOneTime = false,
    this.energyLevel = "medium",
    this.allowedSplits = const [],
  });

  String get unitShortLabel {
    return unitType.shortLabel;
  }

  String get targetLabel => unitType.targetLabel;

  bool get isTimeBased => unitType == UnitType.minutes;

  bool get isCountBased => !isTimeBased;

  bool get isLinkTask => unitType == UnitType.links;

  bool get needsMinRequiredMinutes => unitType.inputSpec.needsMinMinutes;

  int get safeTarget => targetValue < 0 ? 0 : targetValue;

  double get progressRatio {
    if (safeTarget == 0) return 0.0;
    return progress / safeTarget;
  }

  bool fitsMinutes(int maxMinutes) {
    if (unitType == UnitType.minutes) {
      return allowedSplits.any((s) => s <= maxMinutes);
    }
    if (unitType == UnitType.executions || unitType == UnitType.links) {
      return (minRequiredMinutes ?? 0) <= maxMinutes;
    }
    return true;
  }
}

class TaskInputSpec {
  final bool needsTarget;
  final bool needsSplits;
  final bool needsMinMinutes;
  final bool needsLinkCollection;

  const TaskInputSpec({
    this.needsTarget = false,
    this.needsSplits = false,
    this.needsMinMinutes = false,
    this.needsLinkCollection = false,
  });
}
