import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import '../models/task.dart';
import '../models/link_collection.dart';

part 'app_database.g.dart';

class TasksTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get unitType => integer()();
  IntColumn get targetValue => integer()();
  IntColumn get progress => integer()();
  IntColumn get sessionCount => integer()();
  IntColumn get lastSessionValue => integer()();
  IntColumn get minRequiredMinutes => integer().nullable()();
  TextColumn get linkCollectionId => text().nullable()();
  BoolColumn get isOneTime => boolean()();
  TextColumn get energyLevel => text()();
  TextColumn get allowedSplits => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class LinkCollectionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class LinkItemsTable extends Table {
  TextColumn get id => text()();
  TextColumn get collectionId => text()();
  TextColumn get title => text()();
  TextColumn get url => text()();
  BoolColumn get hasDone => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [TasksTable, LinkCollectionsTable, LinkItemsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Task>> getTasks() async {
    final rows = await select(tasksTable).get();
    return rows.map(_taskFromRow).toList();
  }

  Future<void> upsertTask(Task task) async {
    await into(tasksTable).insertOnConflictUpdate(_taskToCompanion(task));
  }

  Future<void> insertTasks(List<Task> tasksList) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(
        tasksTable,
        tasksList.map(_taskToCompanion).toList(),
      );
    });
  }

  Future<List<LinkCollection>> getLinkCollections() async {
    final collections = await select(linkCollectionsTable).get();
    final items = await select(linkItemsTable).get();

    return collections.map((c) {
      final list = items.where((i) => i.collectionId == c.id).map((i) {
        return LinkItem(
          id: i.id,
          title: i.title,
          url: i.url,
          hasDone: i.hasDone,
        );
      }).toList();
      return LinkCollection(id: c.id, title: c.title, items: list);
    }).toList();
  }

  Future<void> upsertLinkCollection(LinkCollection collection) async {
    await transaction(() async {
      await into(linkCollectionsTable)
          .insertOnConflictUpdate(LinkCollectionsTableCompanion(
        id: Value(collection.id),
        title: Value(collection.title),
      ));

      await (delete(linkItemsTable)
            ..where((tbl) => tbl.collectionId.equals(collection.id)))
          .go();

      if (collection.items.isNotEmpty) {
        await batch((b) {
          b.insertAll(
            linkItemsTable,
            collection.items.map((i) {
              return LinkItemsTableCompanion.insert(
                id: i.id,
                collectionId: collection.id,
                title: i.title,
                url: i.url,
                hasDone: i.hasDone,
              );
            }).toList(),
          );
        });
      }
    });
  }

  Future<void> toggleLinkDone(String collectionId, String linkId) async {
    final row = await (select(linkItemsTable)
          ..where((tbl) =>
              tbl.collectionId.equals(collectionId) & tbl.id.equals(linkId)))
        .getSingleOrNull();
    if (row == null) return;

    await (update(linkItemsTable)
          ..where((tbl) =>
              tbl.collectionId.equals(collectionId) & tbl.id.equals(linkId)))
        .write(LinkItemsTableCompanion(
      hasDone: Value(!row.hasDone),
    ));
  }

  Future<void> removeLinkCollection(String id) async {
    await transaction(() async {
      await (delete(linkItemsTable)..where((tbl) => tbl.collectionId.equals(id))).go();
      await (delete(linkCollectionsTable)..where((tbl) => tbl.id.equals(id))).go();
    });
  }

  TasksTableCompanion _taskToCompanion(Task task) {
    return TasksTableCompanion(
      id: Value(task.id),
      title: Value(task.title),
      unitType: Value(task.unitType.index),
      targetValue: Value(task.targetValue),
      progress: Value(task.progress),
      sessionCount: Value(task.sessionCount),
      lastSessionValue: Value(task.lastSessionValue),
      minRequiredMinutes: Value(task.minRequiredMinutes),
      linkCollectionId: Value(task.linkCollectionId),
      isOneTime: Value(task.isOneTime),
      energyLevel: Value(task.energyLevel),
      allowedSplits: Value(jsonEncode(task.allowedSplits)),
    );
  }

  Task _taskFromRow(TasksTableData row) {
    final splits = (jsonDecode(row.allowedSplits) as List<dynamic>)
        .map((e) => e as int)
        .toList();
    return Task(
      id: row.id,
      title: row.title,
      unitType: UnitType.values[row.unitType],
      targetValue: row.targetValue,
      progress: row.progress,
      sessionCount: row.sessionCount,
      lastSessionValue: row.lastSessionValue,
      minRequiredMinutes: row.minRequiredMinutes,
      linkCollectionId: row.linkCollectionId,
      isOneTime: row.isOneTime,
      energyLevel: row.energyLevel,
      allowedSplits: splits,
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    if (kIsWeb) {
      return driftDatabase(
        name: 'task_buffet_db',
        web: DriftWebOptions(
          sqlite3Wasm: Uri.parse('sqlite3.wasm'),
          driftWorker: Uri.parse('drift_worker.js'),
        ),
      );
    }
    return driftDatabase(name: 'task_buffet_db');
  });
}
