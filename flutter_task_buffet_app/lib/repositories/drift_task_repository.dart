import '../db/app_database.dart';
import '../models/task.dart';
import '../models/link_collection.dart';
import 'task_repository.dart';

class DriftTaskRepository implements TaskRepository {
  final AppDatabase _db;

  DriftTaskRepository(this._db);

  @override
  Future<List<Task>> getTasks() => _db.getTasks();

  @override
  Future<void> upsertTask(Task task) => _db.upsertTask(task);

  @override
  Future<void> insertTasks(List<Task> tasks) => _db.insertTasks(tasks);

  @override
  Future<List<LinkCollection>> getLinkCollections() => _db.getLinkCollections();

  @override
  Future<void> upsertLinkCollection(LinkCollection collection) =>
      _db.upsertLinkCollection(collection);

  @override
  Future<void> toggleLinkDone(String collectionId, String linkId) =>
      _db.toggleLinkDone(collectionId, linkId);

  @override
  Future<void> removeLinkCollection(String id) => _db.removeLinkCollection(id);

  @override
  Future<void> close() => _db.close();
}
