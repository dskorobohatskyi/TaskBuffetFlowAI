import '../models/task.dart';
import '../models/link_collection.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
  Future<void> upsertTask(Task task);
  Future<void> insertTasks(List<Task> tasks);

  Future<List<LinkCollection>> getLinkCollections();
  Future<void> upsertLinkCollection(LinkCollection collection);
  Future<void> toggleLinkDone(String collectionId, String linkId);
  Future<void> removeLinkCollection(String id);
  Future<void> close();
}
