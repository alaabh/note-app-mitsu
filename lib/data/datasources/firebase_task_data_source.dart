import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/task.dart';

class FirebaseTaskDataSource {
  final FirebaseFirestore firestore;

  FirebaseTaskDataSource(this.firestore);

  Stream<List<Task>> getTasks(String userId) {
    print("this is userid:$userId");
    return firestore
        .collection('tsks')
        .where('userId', isEqualTo: userId)
        .snapshots() 
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Task(
                id: doc.id,
                title: doc['title'],
                description: doc['description'],
                completed: doc['completed'],
                userId: doc['userId'],
              ))
          .toList();
    });
  }

  Future<void> deleteTask(String taskId) async {
    await firestore.collection('tsks').doc(taskId).delete();
  }

  Future<void> addTask(Task task) async {
    await firestore.collection('tsks').add({
      'title': task.title,
      'description': task.description,
      'completed': task.completed,
      'userId': task.userId,
    });
  }

   
  Future<void> updateTask(Task updatedTask) async {
    try {
      await firestore.collection('tsks').doc(updatedTask.id).update({
        'title': updatedTask.title,
        'description': updatedTask.description,
        'completed': updatedTask.completed,
      });
    } catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }
}
