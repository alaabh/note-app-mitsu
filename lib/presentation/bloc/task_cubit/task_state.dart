part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;
  TaskLoaded(this.tasks);
}

class TaskError extends TaskState {
  final String message;
  TaskError(this.message);
}

class TaskAddLoading extends TaskState {}

class TaskAddSuccess extends TaskState {}

class TaskAddFailure extends TaskState {
  final String message;
  TaskAddFailure(this.message);
}
class TaskUpdateLoading extends TaskState {}

class TaskUpdateSuccess extends TaskState {}

class TaskUpdateFailure extends TaskState {
  final String error;

  TaskUpdateFailure(this.error);

  @override
  List<Object> get props => [error];
}