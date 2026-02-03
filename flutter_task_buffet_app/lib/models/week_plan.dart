import 'task.dart';

class WeekPlan {
  String id;
  String name;
  List<Task> tasks;

  WeekPlan({required this.id, required this.name, this.tasks = const []});
}
