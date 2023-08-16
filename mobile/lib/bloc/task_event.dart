import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {}

class FetchTasks extends TaskEvent {
  @override
  List<Object?> get props => [];
}
