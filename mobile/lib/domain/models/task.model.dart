class TaskModel {
  DateTime createdAt;
  String title;
  String description;
  bool status;
  String? id;

  TaskModel({
    required this.createdAt,
    required this.title,
    required this.description,
    required this.status,
    this.id,
  });

  factory TaskModel.fromJson(dynamic json) {
    return TaskModel(
      createdAt: DateTime.parse(json["createdAt"]),
      title: json["title"],
      description: json["description"],
      status: json["status"],
      id: json["id"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "createdAt": createdAt,
      "title": title,
      "description": description,
      "status": status,
      "id": id,
    };
  }
}
