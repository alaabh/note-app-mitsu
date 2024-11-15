

import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/firebase_task_data_source.dart';

class TaskRepositoryImpl implements TaskRepository {
  final FirebaseTaskDataSource dataSource;

  TaskRepositoryImpl(this.dataSource);

  @override
  Stream<List<Task>> getTasks(String userId) {
    
    return dataSource.getTasks(userId);
  }
  @override
  Future<void> deleteTask(String taskId) {
    return dataSource.deleteTask(taskId);
  }
   @override
  Future<void> addTask(Task task) {
    return dataSource.addTask(task);  
  }
  @override
  Future<void> updateTask(Task task) {
    return dataSource.updateTask(task);  
  }
}

