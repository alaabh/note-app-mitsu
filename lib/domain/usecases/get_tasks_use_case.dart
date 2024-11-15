
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class GetTasksUseCase {
  final TaskRepository repository;

  GetTasksUseCase(this.repository);

  
  Stream<List<Task>> call(String userId) {
    return repository.getTasks(userId);
  }
}

