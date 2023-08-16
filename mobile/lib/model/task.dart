class Task {
  final int taskId;
  final String name;
  final String status;
  final String description;
  final String createdAt;

  Task(
    this.taskId,
    this.name,
    this.status,
    this.description,
    this.createdAt,
  );

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      json['id'] as int,
      json['name'] as String,
      json['description'] as String,
      json['status'] as String,
      json['createdAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': taskId,
      'name': name,
      'description': description,
      'status': status,
      'createdAt': createdAt
    };
  }
}
