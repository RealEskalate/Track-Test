class TaskModel{
  String? id;
  String? title;
  String? description;
  String? createdAt;
  bool? status;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.status
  });


  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        createdAt: json['createdAt'],
        status: json['status'],
      );
        
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['status'] = status;
    return data;
  }

}