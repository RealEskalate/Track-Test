class Task {
  final String id;

  final String description;
  final bool status;
  final String createdAt;
  final String title;

  Task({
    required this.id,
    required this.description,
    required this.title,
    required this.createdAt,
    required this.status,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      description: json['description'],
      status: json['status'],
      createdAt: json['createdAt'],
      title: json['title'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
