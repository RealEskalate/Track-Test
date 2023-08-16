part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class CreateTaskEvent extends TaskEvent {
  final String title;
  final String description;

  CreateTaskEvent({
    required this.title,
    required this.description,
  });

  @override
  List<Object> get props => [title, description];
}

// class UpdateTaskEvent extends TaskEvent {
//   final DateTime previousDate;
//   final DateTime startDate;
//   final DateTime endDate;
//   final int amount;
//   final int chickens;
//   final String recurrence;

//   UpdateTaskEvent({
//     required this.previousDate,
//     required this.startDate,
//     required this.endDate,
//     required this.amount,
//     required this.chickens,
//     required this.recurrence,
//   });

//   @override
//   List<Object> get props =>
//       [previousDate, startDate, endDate, amount, chickens, recurrence];
// }

// class DeleteTaskEvent extends TaskEvent {
//   final DateTime startDate;

//   DeleteTaskEvent({
//     required this.startDate,
//   });

//   @override
//   List<Object> get props => [startDate];
// }

class GetAllTaskEvent extends TaskEvent {
  GetAllTaskEvent();

  @override
  List<Object> get props => [];
}
