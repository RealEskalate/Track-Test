import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/home_page_entity.dart';
import '../../domain/usecases/task_usecase.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskUseCase taskUseCase;
  TaskBloc({required this.taskUseCase}) : super(TaskInitial()) {
    on<CreateTaskEvent>(_handleCreateTask);
    // on<UpdateTaskEvent>(_updateTask);
    // on<GetAllFeedingDataEvent>(_getAllFeedingData);
    // on<DeleteTaskEvent>(_deleteTask);
  }

  Future<void> _handleCreateTask(
      CreateTaskEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    try {
      final Task task = await taskUseCase.createTask(
          description: event.description, title: event.title);
      emit(TaskSuccess(task: task));
    } catch (e) {
      emit(TaskFailure(errorMessage: e.toString()));
    }
  }

  // Future<void> _updateTask(UpdateTaskEvent event,
  //     Emitter<TaskState> emit) async {
  //   emit(UpdateTaskLoading());
  //   try {
  //     final TaskEntity feedingSchedule =
  //         await feedingScheduleUseCase.updateTask(
  //       previousDate: event.previousDate,
  //       startDate: event.startDate,
  //       endDate: event.endDate,
  //       amount: event.amount,
  //       chickens: event.chickens,
  //       recurrence: event.recurrence,
  //     );
  //     emit(UpdateTaskSuccess(feedingSchedule: feedingSchedule));
  //   } catch (e) {
  //     emit(UpdateTaskFailure(errorMessage: e.toString()));
  //   }
  // }

  // Future<void> _deleteTask(DeleteTaskEvent event,
  //     Emitter<TaskState> emit) async {
  //   emit(DeleteTaskLoading());
  //   try {
  //     final TaskEntity feedingSchedule =
  //         await feedingScheduleUseCase.deleteTask(
  //       startDate: event.startDate,
  //     );
  //     emit(DeleteTaskSuccess(feedingSchedule: feedingSchedule));
  //   } catch (e) {
  //     emit(DeleteTaskFailure(errorMessage: e.toString()));
  //   }
  // }

  Future<void> _getAllTasks(
      GetAllTaskEvent event, Emitter<TaskState> emit) async {
    emit(GetAllTasksLoading());
    try {
      final List<Task> tasks = await taskUseCase.getAllTask();
      emit(GetAllTasksSuccess(tasks: tasks));
    } catch (e) {
      emit(TaskFailure(errorMessage: e.toString()));
    }
  }
}
