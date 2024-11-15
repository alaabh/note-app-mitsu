import '../entities/task.dart';

abstract class TaskRepository {

  Stream<List<Task>> getTasks(String userId);

  Future<void> deleteTask(String taskId);

   Future<void> addTask(Task task);  
     Future<void> updateTask(Task task);  

}
