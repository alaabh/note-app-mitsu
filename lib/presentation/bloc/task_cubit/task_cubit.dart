import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes/domain/usecases/add_task_use_case.dart';
import '../../../domain/entities/task.dart';
import '../../../domain/usecases/delete_task_use_case.dart';
import '../../../domain/usecases/get_tasks_use_case.dart';
import '../../../domain/usecases/update_task_use_case.dart';  

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final GetTasksUseCase getTasksUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;  
  final AddTaskUseCase addTaskUseCase;  
    final UpdateTaskUseCase updateTaskUseCase;  


  TaskCubit(this.getTasksUseCase, this.deleteTaskUseCase, this.addTaskUseCase, this.updateTaskUseCase) : super(TaskInitial());

  Stream<List<Task>> fetchTasks(String userId) {
    try {
      return getTasksUseCase.call(userId);
    } catch (e) {
      emit(TaskError('Failed to load tasks'));
      return Stream.empty();
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await deleteTaskUseCase.execute(taskId);
    } catch (e) {
      emit(TaskError('Failed to delete task'));
    }
  }

   
  Future<void> addTask(Task task) async {
    emit(TaskAddLoading());  
    try {
      await addTaskUseCase.call(task);  
      emit(TaskAddSuccess());  
    } catch (e) {
      emit(TaskAddFailure('Failed to add task: ${e.toString()}'));  
    }
  }
  
  Future<void> updateTask(Task updatedTask) async {
    emit(TaskUpdateLoading());
    try {
      await updateTaskUseCase.execute(updatedTask); 
      emit(TaskUpdateSuccess());
    } catch (e) {
      emit(TaskUpdateFailure(e.toString()));
    }
  }
}
