import 'dart:async';
import 'package:path/path.dart';
import 'package:sqlbrite/sqlbrite.dart';

import '../model/task.dart';
import 'storage.dart';

class LocalStorage implements Storage {
  factory LocalStorage() => _singleton;

  LocalStorage._internal();

  static final _singleton = LocalStorage._internal();
  static const _tasksTable = 'Task';

  late BriteDatabase _database;

  @override
  Future<void> initialize() async {
    final name = join(await getDatabasesPath(), 'todo.db');
    //await deleteDatabase(name);

    final database = await openDatabase(
      name,
      onCreate: _onCreate,
      version: 1,
    );

    _database = BriteDatabase(database);
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE $_tasksTable (
  task_id INTEGER PRIMARY KEY AUTOINCREMENT,
  description TEXT NOT NULL,
  due_date TEXT NULL
);
''');
    return db.execute('''
INSERT INTO $_tasksTable (description)
VALUES ("task 1");
''');
  }


  @override
  Stream<List<Task>> getTasks() {
    return _database.createQuery(_tasksTable).mapToList((e) {
      print('Task ID: ${e['task_id']}, Description: ${e['description']}, Due Date: ${e['due_date']}');
      return Task(
        id: e['task_id'].toString(),
        description: e['description'],
        dueDate: null
      );
    }
    );
  }

  @override
  Future<int> insertTask(String description, {DateTime? dueDate}) async {
    print(dueDate);
    final values = {
      'description': description,
      'due_date': dueDate?.millisecondsSinceEpoch,
    };
   final result = await  _database.insert(_tasksTable, values);
    return result;
  }

  @override
  Future<int> removeTask(Task task) async
  {
    return _database.delete(
      _tasksTable,
      where: 'task_id = ?',
      whereArgs: [int.parse(task.id)],
    );
  }
}

