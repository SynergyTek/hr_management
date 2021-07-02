import 'dart:convert';

class TaskModel {

  String taskSubject;
  String taskDescription;

  TaskModel({this.taskSubject,this.taskDescription});

  Map<String, dynamic> toMap() {
    return {
      'taskSubject': taskSubject,
      'taskDescription': taskDescription,
    };
  }


  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      taskSubject: map['taskSubject'],
      taskDescription: map['taskDescription'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source));
}
