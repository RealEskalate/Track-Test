import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile/domain/models/task.model.dart';
import 'package:mobile/infrastructure/repositories/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRemoteRepository repository;
  TaskBloc({required this.repository}) : super(TaskInitial()) {
    on<TaskEvent>((event, emit) async {
      if (event is FetchAllTasks) {
        emit(
          TaskActionInProgress(),
        );
        try {
          var response = await repository.fetchTasks();
          emit(
            AllTasksFetched(tasks: response),
          );
        } catch (e) {
          print(e.toString());
          emit(
            TaskActionFailed(
              message: e.toString(),
            ),
          );
        }
      }
      if (event is AddTaskEvent) {
        emit(
          TaskActionInProgress(),
        );
        try {
          var response = await repository.addTask(event.task);
          if (response == 0) {
            emit(
              TaskActionCompleted(message: "Task Added"),
            );
          } else {
            emit(
              TaskActionFailed(message: "Failed"),
            );
          }
        } catch (e) {
          print(e.toString());
          emit(
            TaskActionFailed(
              message: e.toString(),
            ),
          );
        }
      }
      if (event is UpdateTask) {
        emit(
          TaskActionInProgress(),
        );
        try {
          var response = await repository.updateTask(event.task);
          print("response is $response");
          if (response == 0) {
            emit(TaskActionCompleted(message: "Quote Updated"));
          } else {
            emit(
              TaskActionFailed(
                message: "Failed",
              ),
            );
          }
        } catch (e) {
          print(e.toString());
          emit(
            TaskActionFailed(
              message: e.toString(),
            ),
          );
        }
      }
      if (event is DeleteTask) {
        emit(
          TaskActionInProgress(),
        );
        try {
          var response = await repository.deleteQuote(event.id);
          if (response == 0) {
            emit(TaskActionCompleted(message: "Task Deleted"));
          } else {
            emit(
              TaskActionFailed(
                message: "Failed",
              ),
            );
          }
        } catch (e) {
          print(e.toString());
          emit(
            TaskActionFailed(
              message: e.toString(),
            ),
          );
        }
      }
    });
  }
}
