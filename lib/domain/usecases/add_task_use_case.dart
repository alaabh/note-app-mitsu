import '../entities/task.dart';
import '../repositories/task_repository.dart';

class AddTaskUseCase {
  final TaskRepository repository;

  AddTaskUseCase(this.repository);

  Future<void> call(Task task) {
    return repository.addTask(task);  
  }
}
