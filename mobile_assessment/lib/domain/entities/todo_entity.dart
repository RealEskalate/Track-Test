class TodoEntity{
  String id;
  String title;
  String description;
  bool status;
  TodoEntity({
    required this.title,
    required this.description,
    required this.status,
    required this.id
  });
}