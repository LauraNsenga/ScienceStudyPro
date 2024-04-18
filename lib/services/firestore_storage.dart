import 'package:cloud_firestore/cloud_firestore.dart';

import '../../services/storage.dart';
import 'package:intl/intl.dart';

import '../controllers/auth_controller.dart';

class FirestoreStorage implements Storage {
  static const _tasks = 'tasks';
  static const _description = 'description';
  static const _dueDate = 'due_date';
  static const _user = 'user';

  @override
  Stream<List<Task>> getTasks() {
    print('getTasks');
    final db = FirebaseFirestore.instance;
    final userId = AuthController().userId;

    if (userId == null) {
      // Return an empty stream or handle accordingly if the user is not authenticated.
      return Stream.value([]);
    }

    print('userId: $userId');

    return FirebaseFirestore.instance
        .collection(_user)
        .doc(userId)
        .collection(_tasks)
        .snapshots()
        .map((event) {
      return event.docs.map((doc) {
        final data = doc.data();
        DateTime? dueDate;
        if (data[_dueDate] != null) {
          dueDate = data[_dueDate].toDate() as DateTime;
        }

        print('doc $doc');
        return Task(
          id: doc.id,
          description: doc[FirestoreStorage._description],
          dueDate: dueDate,
        );
      }).toList();
    });
  }

  @override
  Future<void> insertTask(String description, {DateTime? dueDate}) async {
    print('insertTask');
    print(
        'Inserting task: $description, ${dueDate != null ? DateFormat('yyyy-MM-dd').format(dueDate) : ''}');

    print('im here');
    String? userId = AuthController().userId;
    Map<String, dynamic> taskData = {
      _description: description,
      FirestoreStorage._dueDate:
          dueDate != null ? Timestamp.fromDate(dueDate) : null,
    };
    if (userId == null) {
      return;
    }
    await FirebaseFirestore.instance
        .collection(_user)
        .doc(userId)
        .collection(_tasks)
        .add(taskData);
  }

  @override
  Future<void> removeTask(Task task) async {
    print('removeTask');
    String? userId = AuthController().userId;
    if (userId == null) {
      return;
    }
    await FirebaseFirestore.instance
        .collection(_user)
        .doc(userId)
        .collection(_tasks)
        .doc(task.id)
        .delete()
        .then((value) => print(task.description));
  }

  @override
  Future<void> initialize() {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  // @override
  // Future<void> updateTaskCompletion(String id, bool isCompleted) async {
    // try {
    //
    //   DocumentReference taskRef = FirebaseFirestore.instance.collection(_tasks).doc(id);
    //
    //
    //   await taskRef.update({'isCompleted': isCompleted});
    // } catch (e) {
    //   // Handle any potential errors
    //   print('Error updating task completion: $e');
    //   rethrow;
    // }
  // }
}
