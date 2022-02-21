import 'dart:convert';

List<DependentListModel> dependentListModelFromJson(String str) =>
    List<DependentListModel>.from(
        json.decode(str).map((x) => DependentListModel.fromJson(x)));

String dependentListModelToJson(List<DependentListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DependentListModel {
  DependentListModel({
    this.dependentId,
    this.personId,
    this.userId,
    this.firstName,
    this.iqamahIdNationalityId,
    this.relationshipTypeName,
    this.dateOfBirth,
    this.noteId,
    this.userRole,
  });

  String? dependentId;
  dynamic personId;
  dynamic userId;
  String? firstName;
  String? iqamahIdNationalityId;
  String? relationshipTypeName;
  DateTime? dateOfBirth;
  String? noteId;
  dynamic userRole;

  factory DependentListModel.fromJson(Map<String, dynamic> json) =>
      DependentListModel(
        dependentId: json["DependentId"],
        personId: json["PersonId"],
        userId: json["UserId"],
        firstName: json["FirstName"],
        iqamahIdNationalityId: json["IqamahIdNationalityId"],
        relationshipTypeName: json["RelationshipTypeName"],
        dateOfBirth: DateTime.parse(json["DateOfBirth"]),
        noteId: json["NoteId"],
        userRole: json["UserRole"],
      );

  Map<String, dynamic> toJson() => {
        "DependentId": dependentId,
        "PersonId": personId,
        "UserId": userId,
        "FirstName": firstName,
        "IqamahIdNationalityId": iqamahIdNationalityId,
        "RelationshipTypeName": relationshipTypeName,
        "DateOfBirth": dateOfBirth!.toIso8601String(),
        "NoteId": noteId,
        "UserRole": userRole,
      };
}
