import 'package:notes/domain/entities/task.dart';
import 'package:notes/domain/repositories/task_repository.dart';

class UpdateTaskUseCase {
  final TaskRepository repository;

  UpdateTaskUseCase(this.repository);

  Future<void> execute(Task task) async {
    await repository.updateTask(task);  
  }
}
