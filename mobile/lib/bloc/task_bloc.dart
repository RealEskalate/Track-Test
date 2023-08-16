import 'package:bloc/bloc.dart';
import '/data/task_api_service.dart';
import '/bloc/task_event.dart';
import '/bloc/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskApiService apiService = TaskApiService();

  TaskBloc() : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is FetchTasks) {
      yield TaskInitial();
      try {
        print('Fetching tasks...');
        final tasks = await apiService.fetchTasks();
        print('Fetched tasks: $tasks');
        yield TaskLoaded(tasks);
      } catch (_) {
        yield TaskError();
      }
    }
  }
}
