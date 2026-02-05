// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TasksTableTable extends TasksTable
    with TableInfo<$TasksTableTable, TasksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitTypeMeta = const VerificationMeta(
    'unitType',
  );
  @override
  late final GeneratedColumn<int> unitType = GeneratedColumn<int>(
    'unit_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetValueMeta = const VerificationMeta(
    'targetValue',
  );
  @override
  late final GeneratedColumn<int> targetValue = GeneratedColumn<int>(
    'target_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionCountMeta = const VerificationMeta(
    'sessionCount',
  );
  @override
  late final GeneratedColumn<int> sessionCount = GeneratedColumn<int>(
    'session_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSessionValueMeta = const VerificationMeta(
    'lastSessionValue',
  );
  @override
  late final GeneratedColumn<int> lastSessionValue = GeneratedColumn<int>(
    'last_session_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minRequiredMinutesMeta =
      const VerificationMeta('minRequiredMinutes');
  @override
  late final GeneratedColumn<int> minRequiredMinutes = GeneratedColumn<int>(
    'min_required_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _linkCollectionIdMeta = const VerificationMeta(
    'linkCollectionId',
  );
  @override
  late final GeneratedColumn<String> linkCollectionId = GeneratedColumn<String>(
    'link_collection_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isOneTimeMeta = const VerificationMeta(
    'isOneTime',
  );
  @override
  late final GeneratedColumn<bool> isOneTime = GeneratedColumn<bool>(
    'is_one_time',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_one_time" IN (0, 1))',
    ),
  );
  static const VerificationMeta _energyLevelMeta = const VerificationMeta(
    'energyLevel',
  );
  @override
  late final GeneratedColumn<String> energyLevel = GeneratedColumn<String>(
    'energy_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _allowedSplitsMeta = const VerificationMeta(
    'allowedSplits',
  );
  @override
  late final GeneratedColumn<String> allowedSplits = GeneratedColumn<String>(
    'allowed_splits',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    unitType,
    targetValue,
    progress,
    sessionCount,
    lastSessionValue,
    minRequiredMinutes,
    linkCollectionId,
    isOneTime,
    energyLevel,
    allowedSplits,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TasksTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('unit_type')) {
      context.handle(
        _unitTypeMeta,
        unitType.isAcceptableOrUnknown(data['unit_type']!, _unitTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_unitTypeMeta);
    }
    if (data.containsKey('target_value')) {
      context.handle(
        _targetValueMeta,
        targetValue.isAcceptableOrUnknown(
          data['target_value']!,
          _targetValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetValueMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    } else if (isInserting) {
      context.missing(_progressMeta);
    }
    if (data.containsKey('session_count')) {
      context.handle(
        _sessionCountMeta,
        sessionCount.isAcceptableOrUnknown(
          data['session_count']!,
          _sessionCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sessionCountMeta);
    }
    if (data.containsKey('last_session_value')) {
      context.handle(
        _lastSessionValueMeta,
        lastSessionValue.isAcceptableOrUnknown(
          data['last_session_value']!,
          _lastSessionValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastSessionValueMeta);
    }
    if (data.containsKey('min_required_minutes')) {
      context.handle(
        _minRequiredMinutesMeta,
        minRequiredMinutes.isAcceptableOrUnknown(
          data['min_required_minutes']!,
          _minRequiredMinutesMeta,
        ),
      );
    }
    if (data.containsKey('link_collection_id')) {
      context.handle(
        _linkCollectionIdMeta,
        linkCollectionId.isAcceptableOrUnknown(
          data['link_collection_id']!,
          _linkCollectionIdMeta,
        ),
      );
    }
    if (data.containsKey('is_one_time')) {
      context.handle(
        _isOneTimeMeta,
        isOneTime.isAcceptableOrUnknown(data['is_one_time']!, _isOneTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_isOneTimeMeta);
    }
    if (data.containsKey('energy_level')) {
      context.handle(
        _energyLevelMeta,
        energyLevel.isAcceptableOrUnknown(
          data['energy_level']!,
          _energyLevelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_energyLevelMeta);
    }
    if (data.containsKey('allowed_splits')) {
      context.handle(
        _allowedSplitsMeta,
        allowedSplits.isAcceptableOrUnknown(
          data['allowed_splits']!,
          _allowedSplitsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_allowedSplitsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TasksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TasksTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      unitType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_type'],
      )!,
      targetValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_value'],
      )!,
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}progress'],
      )!,
      sessionCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_count'],
      )!,
      lastSessionValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_session_value'],
      )!,
      minRequiredMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}min_required_minutes'],
      ),
      linkCollectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}link_collection_id'],
      ),
      isOneTime: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_one_time'],
      )!,
      energyLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}energy_level'],
      )!,
      allowedSplits: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allowed_splits'],
      )!,
    );
  }

  @override
  $TasksTableTable createAlias(String alias) {
    return $TasksTableTable(attachedDatabase, alias);
  }
}

class TasksTableData extends DataClass implements Insertable<TasksTableData> {
  final String id;
  final String title;
  final int unitType;
  final int targetValue;
  final int progress;
  final int sessionCount;
  final int lastSessionValue;
  final int? minRequiredMinutes;
  final String? linkCollectionId;
  final bool isOneTime;
  final String energyLevel;
  final String allowedSplits;
  const TasksTableData({
    required this.id,
    required this.title,
    required this.unitType,
    required this.targetValue,
    required this.progress,
    required this.sessionCount,
    required this.lastSessionValue,
    this.minRequiredMinutes,
    this.linkCollectionId,
    required this.isOneTime,
    required this.energyLevel,
    required this.allowedSplits,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['unit_type'] = Variable<int>(unitType);
    map['target_value'] = Variable<int>(targetValue);
    map['progress'] = Variable<int>(progress);
    map['session_count'] = Variable<int>(sessionCount);
    map['last_session_value'] = Variable<int>(lastSessionValue);
    if (!nullToAbsent || minRequiredMinutes != null) {
      map['min_required_minutes'] = Variable<int>(minRequiredMinutes);
    }
    if (!nullToAbsent || linkCollectionId != null) {
      map['link_collection_id'] = Variable<String>(linkCollectionId);
    }
    map['is_one_time'] = Variable<bool>(isOneTime);
    map['energy_level'] = Variable<String>(energyLevel);
    map['allowed_splits'] = Variable<String>(allowedSplits);
    return map;
  }

  TasksTableCompanion toCompanion(bool nullToAbsent) {
    return TasksTableCompanion(
      id: Value(id),
      title: Value(title),
      unitType: Value(unitType),
      targetValue: Value(targetValue),
      progress: Value(progress),
      sessionCount: Value(sessionCount),
      lastSessionValue: Value(lastSessionValue),
      minRequiredMinutes: minRequiredMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(minRequiredMinutes),
      linkCollectionId: linkCollectionId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkCollectionId),
      isOneTime: Value(isOneTime),
      energyLevel: Value(energyLevel),
      allowedSplits: Value(allowedSplits),
    );
  }

  factory TasksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TasksTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      unitType: serializer.fromJson<int>(json['unitType']),
      targetValue: serializer.fromJson<int>(json['targetValue']),
      progress: serializer.fromJson<int>(json['progress']),
      sessionCount: serializer.fromJson<int>(json['sessionCount']),
      lastSessionValue: serializer.fromJson<int>(json['lastSessionValue']),
      minRequiredMinutes: serializer.fromJson<int?>(json['minRequiredMinutes']),
      linkCollectionId: serializer.fromJson<String?>(json['linkCollectionId']),
      isOneTime: serializer.fromJson<bool>(json['isOneTime']),
      energyLevel: serializer.fromJson<String>(json['energyLevel']),
      allowedSplits: serializer.fromJson<String>(json['allowedSplits']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'unitType': serializer.toJson<int>(unitType),
      'targetValue': serializer.toJson<int>(targetValue),
      'progress': serializer.toJson<int>(progress),
      'sessionCount': serializer.toJson<int>(sessionCount),
      'lastSessionValue': serializer.toJson<int>(lastSessionValue),
      'minRequiredMinutes': serializer.toJson<int?>(minRequiredMinutes),
      'linkCollectionId': serializer.toJson<String?>(linkCollectionId),
      'isOneTime': serializer.toJson<bool>(isOneTime),
      'energyLevel': serializer.toJson<String>(energyLevel),
      'allowedSplits': serializer.toJson<String>(allowedSplits),
    };
  }

  TasksTableData copyWith({
    String? id,
    String? title,
    int? unitType,
    int? targetValue,
    int? progress,
    int? sessionCount,
    int? lastSessionValue,
    Value<int?> minRequiredMinutes = const Value.absent(),
    Value<String?> linkCollectionId = const Value.absent(),
    bool? isOneTime,
    String? energyLevel,
    String? allowedSplits,
  }) => TasksTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    unitType: unitType ?? this.unitType,
    targetValue: targetValue ?? this.targetValue,
    progress: progress ?? this.progress,
    sessionCount: sessionCount ?? this.sessionCount,
    lastSessionValue: lastSessionValue ?? this.lastSessionValue,
    minRequiredMinutes: minRequiredMinutes.present
        ? minRequiredMinutes.value
        : this.minRequiredMinutes,
    linkCollectionId: linkCollectionId.present
        ? linkCollectionId.value
        : this.linkCollectionId,
    isOneTime: isOneTime ?? this.isOneTime,
    energyLevel: energyLevel ?? this.energyLevel,
    allowedSplits: allowedSplits ?? this.allowedSplits,
  );
  TasksTableData copyWithCompanion(TasksTableCompanion data) {
    return TasksTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      unitType: data.unitType.present ? data.unitType.value : this.unitType,
      targetValue: data.targetValue.present
          ? data.targetValue.value
          : this.targetValue,
      progress: data.progress.present ? data.progress.value : this.progress,
      sessionCount: data.sessionCount.present
          ? data.sessionCount.value
          : this.sessionCount,
      lastSessionValue: data.lastSessionValue.present
          ? data.lastSessionValue.value
          : this.lastSessionValue,
      minRequiredMinutes: data.minRequiredMinutes.present
          ? data.minRequiredMinutes.value
          : this.minRequiredMinutes,
      linkCollectionId: data.linkCollectionId.present
          ? data.linkCollectionId.value
          : this.linkCollectionId,
      isOneTime: data.isOneTime.present ? data.isOneTime.value : this.isOneTime,
      energyLevel: data.energyLevel.present
          ? data.energyLevel.value
          : this.energyLevel,
      allowedSplits: data.allowedSplits.present
          ? data.allowedSplits.value
          : this.allowedSplits,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TasksTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('unitType: $unitType, ')
          ..write('targetValue: $targetValue, ')
          ..write('progress: $progress, ')
          ..write('sessionCount: $sessionCount, ')
          ..write('lastSessionValue: $lastSessionValue, ')
          ..write('minRequiredMinutes: $minRequiredMinutes, ')
          ..write('linkCollectionId: $linkCollectionId, ')
          ..write('isOneTime: $isOneTime, ')
          ..write('energyLevel: $energyLevel, ')
          ..write('allowedSplits: $allowedSplits')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    unitType,
    targetValue,
    progress,
    sessionCount,
    lastSessionValue,
    minRequiredMinutes,
    linkCollectionId,
    isOneTime,
    energyLevel,
    allowedSplits,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TasksTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.unitType == this.unitType &&
          other.targetValue == this.targetValue &&
          other.progress == this.progress &&
          other.sessionCount == this.sessionCount &&
          other.lastSessionValue == this.lastSessionValue &&
          other.minRequiredMinutes == this.minRequiredMinutes &&
          other.linkCollectionId == this.linkCollectionId &&
          other.isOneTime == this.isOneTime &&
          other.energyLevel == this.energyLevel &&
          other.allowedSplits == this.allowedSplits);
}

class TasksTableCompanion extends UpdateCompanion<TasksTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> unitType;
  final Value<int> targetValue;
  final Value<int> progress;
  final Value<int> sessionCount;
  final Value<int> lastSessionValue;
  final Value<int?> minRequiredMinutes;
  final Value<String?> linkCollectionId;
  final Value<bool> isOneTime;
  final Value<String> energyLevel;
  final Value<String> allowedSplits;
  final Value<int> rowid;
  const TasksTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.unitType = const Value.absent(),
    this.targetValue = const Value.absent(),
    this.progress = const Value.absent(),
    this.sessionCount = const Value.absent(),
    this.lastSessionValue = const Value.absent(),
    this.minRequiredMinutes = const Value.absent(),
    this.linkCollectionId = const Value.absent(),
    this.isOneTime = const Value.absent(),
    this.energyLevel = const Value.absent(),
    this.allowedSplits = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksTableCompanion.insert({
    required String id,
    required String title,
    required int unitType,
    required int targetValue,
    required int progress,
    required int sessionCount,
    required int lastSessionValue,
    this.minRequiredMinutes = const Value.absent(),
    this.linkCollectionId = const Value.absent(),
    required bool isOneTime,
    required String energyLevel,
    required String allowedSplits,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       unitType = Value(unitType),
       targetValue = Value(targetValue),
       progress = Value(progress),
       sessionCount = Value(sessionCount),
       lastSessionValue = Value(lastSessionValue),
       isOneTime = Value(isOneTime),
       energyLevel = Value(energyLevel),
       allowedSplits = Value(allowedSplits);
  static Insertable<TasksTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? unitType,
    Expression<int>? targetValue,
    Expression<int>? progress,
    Expression<int>? sessionCount,
    Expression<int>? lastSessionValue,
    Expression<int>? minRequiredMinutes,
    Expression<String>? linkCollectionId,
    Expression<bool>? isOneTime,
    Expression<String>? energyLevel,
    Expression<String>? allowedSplits,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (unitType != null) 'unit_type': unitType,
      if (targetValue != null) 'target_value': targetValue,
      if (progress != null) 'progress': progress,
      if (sessionCount != null) 'session_count': sessionCount,
      if (lastSessionValue != null) 'last_session_value': lastSessionValue,
      if (minRequiredMinutes != null)
        'min_required_minutes': minRequiredMinutes,
      if (linkCollectionId != null) 'link_collection_id': linkCollectionId,
      if (isOneTime != null) 'is_one_time': isOneTime,
      if (energyLevel != null) 'energy_level': energyLevel,
      if (allowedSplits != null) 'allowed_splits': allowedSplits,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<int>? unitType,
    Value<int>? targetValue,
    Value<int>? progress,
    Value<int>? sessionCount,
    Value<int>? lastSessionValue,
    Value<int?>? minRequiredMinutes,
    Value<String?>? linkCollectionId,
    Value<bool>? isOneTime,
    Value<String>? energyLevel,
    Value<String>? allowedSplits,
    Value<int>? rowid,
  }) {
    return TasksTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      unitType: unitType ?? this.unitType,
      targetValue: targetValue ?? this.targetValue,
      progress: progress ?? this.progress,
      sessionCount: sessionCount ?? this.sessionCount,
      lastSessionValue: lastSessionValue ?? this.lastSessionValue,
      minRequiredMinutes: minRequiredMinutes ?? this.minRequiredMinutes,
      linkCollectionId: linkCollectionId ?? this.linkCollectionId,
      isOneTime: isOneTime ?? this.isOneTime,
      energyLevel: energyLevel ?? this.energyLevel,
      allowedSplits: allowedSplits ?? this.allowedSplits,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (unitType.present) {
      map['unit_type'] = Variable<int>(unitType.value);
    }
    if (targetValue.present) {
      map['target_value'] = Variable<int>(targetValue.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    if (sessionCount.present) {
      map['session_count'] = Variable<int>(sessionCount.value);
    }
    if (lastSessionValue.present) {
      map['last_session_value'] = Variable<int>(lastSessionValue.value);
    }
    if (minRequiredMinutes.present) {
      map['min_required_minutes'] = Variable<int>(minRequiredMinutes.value);
    }
    if (linkCollectionId.present) {
      map['link_collection_id'] = Variable<String>(linkCollectionId.value);
    }
    if (isOneTime.present) {
      map['is_one_time'] = Variable<bool>(isOneTime.value);
    }
    if (energyLevel.present) {
      map['energy_level'] = Variable<String>(energyLevel.value);
    }
    if (allowedSplits.present) {
      map['allowed_splits'] = Variable<String>(allowedSplits.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('unitType: $unitType, ')
          ..write('targetValue: $targetValue, ')
          ..write('progress: $progress, ')
          ..write('sessionCount: $sessionCount, ')
          ..write('lastSessionValue: $lastSessionValue, ')
          ..write('minRequiredMinutes: $minRequiredMinutes, ')
          ..write('linkCollectionId: $linkCollectionId, ')
          ..write('isOneTime: $isOneTime, ')
          ..write('energyLevel: $energyLevel, ')
          ..write('allowedSplits: $allowedSplits, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LinkCollectionsTableTable extends LinkCollectionsTable
    with TableInfo<$LinkCollectionsTableTable, LinkCollectionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LinkCollectionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'link_collections_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LinkCollectionsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LinkCollectionsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LinkCollectionsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
    );
  }

  @override
  $LinkCollectionsTableTable createAlias(String alias) {
    return $LinkCollectionsTableTable(attachedDatabase, alias);
  }
}

class LinkCollectionsTableData extends DataClass
    implements Insertable<LinkCollectionsTableData> {
  final String id;
  final String title;
  const LinkCollectionsTableData({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  LinkCollectionsTableCompanion toCompanion(bool nullToAbsent) {
    return LinkCollectionsTableCompanion(id: Value(id), title: Value(title));
  }

  factory LinkCollectionsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LinkCollectionsTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  LinkCollectionsTableData copyWith({String? id, String? title}) =>
      LinkCollectionsTableData(id: id ?? this.id, title: title ?? this.title);
  LinkCollectionsTableData copyWithCompanion(
    LinkCollectionsTableCompanion data,
  ) {
    return LinkCollectionsTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LinkCollectionsTableData(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LinkCollectionsTableData &&
          other.id == this.id &&
          other.title == this.title);
}

class LinkCollectionsTableCompanion
    extends UpdateCompanion<LinkCollectionsTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> rowid;
  const LinkCollectionsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LinkCollectionsTableCompanion.insert({
    required String id,
    required String title,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title);
  static Insertable<LinkCollectionsTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LinkCollectionsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<int>? rowid,
  }) {
    return LinkCollectionsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinkCollectionsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LinkItemsTableTable extends LinkItemsTable
    with TableInfo<$LinkItemsTableTable, LinkItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LinkItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _collectionIdMeta = const VerificationMeta(
    'collectionId',
  );
  @override
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
    'collection_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hasDoneMeta = const VerificationMeta(
    'hasDone',
  );
  @override
  late final GeneratedColumn<bool> hasDone = GeneratedColumn<bool>(
    'has_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_done" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, collectionId, title, url, hasDone];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'link_items_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LinkItemsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('collection_id')) {
      context.handle(
        _collectionIdMeta,
        collectionId.isAcceptableOrUnknown(
          data['collection_id']!,
          _collectionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('has_done')) {
      context.handle(
        _hasDoneMeta,
        hasDone.isAcceptableOrUnknown(data['has_done']!, _hasDoneMeta),
      );
    } else if (isInserting) {
      context.missing(_hasDoneMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LinkItemsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LinkItemsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      collectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}collection_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      hasDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_done'],
      )!,
    );
  }

  @override
  $LinkItemsTableTable createAlias(String alias) {
    return $LinkItemsTableTable(attachedDatabase, alias);
  }
}

class LinkItemsTableData extends DataClass
    implements Insertable<LinkItemsTableData> {
  final String id;
  final String collectionId;
  final String title;
  final String url;
  final bool hasDone;
  const LinkItemsTableData({
    required this.id,
    required this.collectionId,
    required this.title,
    required this.url,
    required this.hasDone,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['collection_id'] = Variable<String>(collectionId);
    map['title'] = Variable<String>(title);
    map['url'] = Variable<String>(url);
    map['has_done'] = Variable<bool>(hasDone);
    return map;
  }

  LinkItemsTableCompanion toCompanion(bool nullToAbsent) {
    return LinkItemsTableCompanion(
      id: Value(id),
      collectionId: Value(collectionId),
      title: Value(title),
      url: Value(url),
      hasDone: Value(hasDone),
    );
  }

  factory LinkItemsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LinkItemsTableData(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collectionId']),
      title: serializer.fromJson<String>(json['title']),
      url: serializer.fromJson<String>(json['url']),
      hasDone: serializer.fromJson<bool>(json['hasDone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collectionId': serializer.toJson<String>(collectionId),
      'title': serializer.toJson<String>(title),
      'url': serializer.toJson<String>(url),
      'hasDone': serializer.toJson<bool>(hasDone),
    };
  }

  LinkItemsTableData copyWith({
    String? id,
    String? collectionId,
    String? title,
    String? url,
    bool? hasDone,
  }) => LinkItemsTableData(
    id: id ?? this.id,
    collectionId: collectionId ?? this.collectionId,
    title: title ?? this.title,
    url: url ?? this.url,
    hasDone: hasDone ?? this.hasDone,
  );
  LinkItemsTableData copyWithCompanion(LinkItemsTableCompanion data) {
    return LinkItemsTableData(
      id: data.id.present ? data.id.value : this.id,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
      title: data.title.present ? data.title.value : this.title,
      url: data.url.present ? data.url.value : this.url,
      hasDone: data.hasDone.present ? data.hasDone.value : this.hasDone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LinkItemsTableData(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('hasDone: $hasDone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, collectionId, title, url, hasDone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LinkItemsTableData &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.title == this.title &&
          other.url == this.url &&
          other.hasDone == this.hasDone);
}

class LinkItemsTableCompanion extends UpdateCompanion<LinkItemsTableData> {
  final Value<String> id;
  final Value<String> collectionId;
  final Value<String> title;
  final Value<String> url;
  final Value<bool> hasDone;
  final Value<int> rowid;
  const LinkItemsTableCompanion({
    this.id = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.hasDone = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LinkItemsTableCompanion.insert({
    required String id,
    required String collectionId,
    required String title,
    required String url,
    required bool hasDone,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       collectionId = Value(collectionId),
       title = Value(title),
       url = Value(url),
       hasDone = Value(hasDone);
  static Insertable<LinkItemsTableData> custom({
    Expression<String>? id,
    Expression<String>? collectionId,
    Expression<String>? title,
    Expression<String>? url,
    Expression<bool>? hasDone,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (collectionId != null) 'collection_id': collectionId,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (hasDone != null) 'has_done': hasDone,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LinkItemsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? collectionId,
    Value<String>? title,
    Value<String>? url,
    Value<bool>? hasDone,
    Value<int>? rowid,
  }) {
    return LinkItemsTableCompanion(
      id: id ?? this.id,
      collectionId: collectionId ?? this.collectionId,
      title: title ?? this.title,
      url: url ?? this.url,
      hasDone: hasDone ?? this.hasDone,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<String>(collectionId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (hasDone.present) {
      map['has_done'] = Variable<bool>(hasDone.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinkItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('hasDone: $hasDone, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TasksTableTable tasksTable = $TasksTableTable(this);
  late final $LinkCollectionsTableTable linkCollectionsTable =
      $LinkCollectionsTableTable(this);
  late final $LinkItemsTableTable linkItemsTable = $LinkItemsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tasksTable,
    linkCollectionsTable,
    linkItemsTable,
  ];
}

typedef $$TasksTableTableCreateCompanionBuilder =
    TasksTableCompanion Function({
      required String id,
      required String title,
      required int unitType,
      required int targetValue,
      required int progress,
      required int sessionCount,
      required int lastSessionValue,
      Value<int?> minRequiredMinutes,
      Value<String?> linkCollectionId,
      required bool isOneTime,
      required String energyLevel,
      required String allowedSplits,
      Value<int> rowid,
    });
typedef $$TasksTableTableUpdateCompanionBuilder =
    TasksTableCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<int> unitType,
      Value<int> targetValue,
      Value<int> progress,
      Value<int> sessionCount,
      Value<int> lastSessionValue,
      Value<int?> minRequiredMinutes,
      Value<String?> linkCollectionId,
      Value<bool> isOneTime,
      Value<String> energyLevel,
      Value<String> allowedSplits,
      Value<int> rowid,
    });

class $$TasksTableTableFilterComposer
    extends Composer<_$AppDatabase, $TasksTableTable> {
  $$TasksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitType => $composableBuilder(
    column: $table.unitType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sessionCount => $composableBuilder(
    column: $table.sessionCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastSessionValue => $composableBuilder(
    column: $table.lastSessionValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minRequiredMinutes => $composableBuilder(
    column: $table.minRequiredMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkCollectionId => $composableBuilder(
    column: $table.linkCollectionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isOneTime => $composableBuilder(
    column: $table.isOneTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get energyLevel => $composableBuilder(
    column: $table.energyLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allowedSplits => $composableBuilder(
    column: $table.allowedSplits,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TasksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTableTable> {
  $$TasksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitType => $composableBuilder(
    column: $table.unitType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sessionCount => $composableBuilder(
    column: $table.sessionCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastSessionValue => $composableBuilder(
    column: $table.lastSessionValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minRequiredMinutes => $composableBuilder(
    column: $table.minRequiredMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkCollectionId => $composableBuilder(
    column: $table.linkCollectionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isOneTime => $composableBuilder(
    column: $table.isOneTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get energyLevel => $composableBuilder(
    column: $table.energyLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allowedSplits => $composableBuilder(
    column: $table.allowedSplits,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TasksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTableTable> {
  $$TasksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get unitType =>
      $composableBuilder(column: $table.unitType, builder: (column) => column);

  GeneratedColumn<int> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<int> get sessionCount => $composableBuilder(
    column: $table.sessionCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastSessionValue => $composableBuilder(
    column: $table.lastSessionValue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get minRequiredMinutes => $composableBuilder(
    column: $table.minRequiredMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get linkCollectionId => $composableBuilder(
    column: $table.linkCollectionId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isOneTime =>
      $composableBuilder(column: $table.isOneTime, builder: (column) => column);

  GeneratedColumn<String> get energyLevel => $composableBuilder(
    column: $table.energyLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get allowedSplits => $composableBuilder(
    column: $table.allowedSplits,
    builder: (column) => column,
  );
}

class $$TasksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TasksTableTable,
          TasksTableData,
          $$TasksTableTableFilterComposer,
          $$TasksTableTableOrderingComposer,
          $$TasksTableTableAnnotationComposer,
          $$TasksTableTableCreateCompanionBuilder,
          $$TasksTableTableUpdateCompanionBuilder,
          (
            TasksTableData,
            BaseReferences<_$AppDatabase, $TasksTableTable, TasksTableData>,
          ),
          TasksTableData,
          PrefetchHooks Function()
        > {
  $$TasksTableTableTableManager(_$AppDatabase db, $TasksTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> unitType = const Value.absent(),
                Value<int> targetValue = const Value.absent(),
                Value<int> progress = const Value.absent(),
                Value<int> sessionCount = const Value.absent(),
                Value<int> lastSessionValue = const Value.absent(),
                Value<int?> minRequiredMinutes = const Value.absent(),
                Value<String?> linkCollectionId = const Value.absent(),
                Value<bool> isOneTime = const Value.absent(),
                Value<String> energyLevel = const Value.absent(),
                Value<String> allowedSplits = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasksTableCompanion(
                id: id,
                title: title,
                unitType: unitType,
                targetValue: targetValue,
                progress: progress,
                sessionCount: sessionCount,
                lastSessionValue: lastSessionValue,
                minRequiredMinutes: minRequiredMinutes,
                linkCollectionId: linkCollectionId,
                isOneTime: isOneTime,
                energyLevel: energyLevel,
                allowedSplits: allowedSplits,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required int unitType,
                required int targetValue,
                required int progress,
                required int sessionCount,
                required int lastSessionValue,
                Value<int?> minRequiredMinutes = const Value.absent(),
                Value<String?> linkCollectionId = const Value.absent(),
                required bool isOneTime,
                required String energyLevel,
                required String allowedSplits,
                Value<int> rowid = const Value.absent(),
              }) => TasksTableCompanion.insert(
                id: id,
                title: title,
                unitType: unitType,
                targetValue: targetValue,
                progress: progress,
                sessionCount: sessionCount,
                lastSessionValue: lastSessionValue,
                minRequiredMinutes: minRequiredMinutes,
                linkCollectionId: linkCollectionId,
                isOneTime: isOneTime,
                energyLevel: energyLevel,
                allowedSplits: allowedSplits,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TasksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TasksTableTable,
      TasksTableData,
      $$TasksTableTableFilterComposer,
      $$TasksTableTableOrderingComposer,
      $$TasksTableTableAnnotationComposer,
      $$TasksTableTableCreateCompanionBuilder,
      $$TasksTableTableUpdateCompanionBuilder,
      (
        TasksTableData,
        BaseReferences<_$AppDatabase, $TasksTableTable, TasksTableData>,
      ),
      TasksTableData,
      PrefetchHooks Function()
    >;
typedef $$LinkCollectionsTableTableCreateCompanionBuilder =
    LinkCollectionsTableCompanion Function({
      required String id,
      required String title,
      Value<int> rowid,
    });
typedef $$LinkCollectionsTableTableUpdateCompanionBuilder =
    LinkCollectionsTableCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<int> rowid,
    });

class $$LinkCollectionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $LinkCollectionsTableTable> {
  $$LinkCollectionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LinkCollectionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LinkCollectionsTableTable> {
  $$LinkCollectionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LinkCollectionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LinkCollectionsTableTable> {
  $$LinkCollectionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);
}

class $$LinkCollectionsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LinkCollectionsTableTable,
          LinkCollectionsTableData,
          $$LinkCollectionsTableTableFilterComposer,
          $$LinkCollectionsTableTableOrderingComposer,
          $$LinkCollectionsTableTableAnnotationComposer,
          $$LinkCollectionsTableTableCreateCompanionBuilder,
          $$LinkCollectionsTableTableUpdateCompanionBuilder,
          (
            LinkCollectionsTableData,
            BaseReferences<
              _$AppDatabase,
              $LinkCollectionsTableTable,
              LinkCollectionsTableData
            >,
          ),
          LinkCollectionsTableData,
          PrefetchHooks Function()
        > {
  $$LinkCollectionsTableTableTableManager(
    _$AppDatabase db,
    $LinkCollectionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LinkCollectionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LinkCollectionsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LinkCollectionsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LinkCollectionsTableCompanion(
                id: id,
                title: title,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<int> rowid = const Value.absent(),
              }) => LinkCollectionsTableCompanion.insert(
                id: id,
                title: title,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LinkCollectionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LinkCollectionsTableTable,
      LinkCollectionsTableData,
      $$LinkCollectionsTableTableFilterComposer,
      $$LinkCollectionsTableTableOrderingComposer,
      $$LinkCollectionsTableTableAnnotationComposer,
      $$LinkCollectionsTableTableCreateCompanionBuilder,
      $$LinkCollectionsTableTableUpdateCompanionBuilder,
      (
        LinkCollectionsTableData,
        BaseReferences<
          _$AppDatabase,
          $LinkCollectionsTableTable,
          LinkCollectionsTableData
        >,
      ),
      LinkCollectionsTableData,
      PrefetchHooks Function()
    >;
typedef $$LinkItemsTableTableCreateCompanionBuilder =
    LinkItemsTableCompanion Function({
      required String id,
      required String collectionId,
      required String title,
      required String url,
      required bool hasDone,
      Value<int> rowid,
    });
typedef $$LinkItemsTableTableUpdateCompanionBuilder =
    LinkItemsTableCompanion Function({
      Value<String> id,
      Value<String> collectionId,
      Value<String> title,
      Value<String> url,
      Value<bool> hasDone,
      Value<int> rowid,
    });

class $$LinkItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $LinkItemsTableTable> {
  $$LinkItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get collectionId => $composableBuilder(
    column: $table.collectionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasDone => $composableBuilder(
    column: $table.hasDone,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LinkItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LinkItemsTableTable> {
  $$LinkItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get collectionId => $composableBuilder(
    column: $table.collectionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasDone => $composableBuilder(
    column: $table.hasDone,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LinkItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LinkItemsTableTable> {
  $$LinkItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get collectionId => $composableBuilder(
    column: $table.collectionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<bool> get hasDone =>
      $composableBuilder(column: $table.hasDone, builder: (column) => column);
}

class $$LinkItemsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LinkItemsTableTable,
          LinkItemsTableData,
          $$LinkItemsTableTableFilterComposer,
          $$LinkItemsTableTableOrderingComposer,
          $$LinkItemsTableTableAnnotationComposer,
          $$LinkItemsTableTableCreateCompanionBuilder,
          $$LinkItemsTableTableUpdateCompanionBuilder,
          (
            LinkItemsTableData,
            BaseReferences<
              _$AppDatabase,
              $LinkItemsTableTable,
              LinkItemsTableData
            >,
          ),
          LinkItemsTableData,
          PrefetchHooks Function()
        > {
  $$LinkItemsTableTableTableManager(
    _$AppDatabase db,
    $LinkItemsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LinkItemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LinkItemsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LinkItemsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> collectionId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<bool> hasDone = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LinkItemsTableCompanion(
                id: id,
                collectionId: collectionId,
                title: title,
                url: url,
                hasDone: hasDone,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String collectionId,
                required String title,
                required String url,
                required bool hasDone,
                Value<int> rowid = const Value.absent(),
              }) => LinkItemsTableCompanion.insert(
                id: id,
                collectionId: collectionId,
                title: title,
                url: url,
                hasDone: hasDone,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LinkItemsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LinkItemsTableTable,
      LinkItemsTableData,
      $$LinkItemsTableTableFilterComposer,
      $$LinkItemsTableTableOrderingComposer,
      $$LinkItemsTableTableAnnotationComposer,
      $$LinkItemsTableTableCreateCompanionBuilder,
      $$LinkItemsTableTableUpdateCompanionBuilder,
      (
        LinkItemsTableData,
        BaseReferences<_$AppDatabase, $LinkItemsTableTable, LinkItemsTableData>,
      ),
      LinkItemsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TasksTableTableTableManager get tasksTable =>
      $$TasksTableTableTableManager(_db, _db.tasksTable);
  $$LinkCollectionsTableTableTableManager get linkCollectionsTable =>
      $$LinkCollectionsTableTableTableManager(_db, _db.linkCollectionsTable);
  $$LinkItemsTableTableTableManager get linkItemsTable =>
      $$LinkItemsTableTableTableManager(_db, _db.linkItemsTable);
}
