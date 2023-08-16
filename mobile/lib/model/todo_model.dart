class TodoModel {
  String? createdAt;
  String? name;
  String? description;
  bool status;
  String id;

  TodoModel({
    required this.createdAt,
    required this.name,
    required this.description,
    required this.status,
    required this.id,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        createdAt: json["createdAt"],
        name: json["title"],
        description: json["description"],
        status: json["status"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "title": name,
        "description": description,
        "status": status,
        "id": id,
      };
}
