class AllTaskModel {
  List<Data>? data;

  AllTaskModel({this.data});

  AllTaskModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaskModel {
  String? createdAt;
  String? title;
  String? description;
  bool? status;
  String? id;

  TaskModel(
      {this.createdAt, this.title, this.description, this.status, this.id});

  TaskModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['id'] = this.id;
    return data;
  }
}

class Data {
  String? id;
  String? createdAt;
  String? title;
  String? description;
  bool? status;

  Data({this.createdAt, this.description, this.id, this.status, this.title});

  Data.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['id'] = this.id;
    return data;
  }
}
