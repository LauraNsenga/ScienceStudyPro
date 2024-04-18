import '../model/study.dart';

abstract class Storage {
  Future<void> initialize();

  Stream<List<Task>> getTasks();

  Future<void> insertTask(String description,{DateTime? dueDate});

  Future<void> removeTask(Task task);
}
