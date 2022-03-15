import 'dart:convert';

class EmployeePortalModel {
  final bool isEmployeePortal;

  const EmployeePortalModel({
    required this.isEmployeePortal,
  });

  EmployeePortalModel copyWith({
    bool? isEmployeePortal,
  }) {
    return EmployeePortalModel(
      isEmployeePortal: isEmployeePortal ?? this.isEmployeePortal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isEmployeePortal': isEmployeePortal,
    };
  }

  factory EmployeePortalModel.fromMap(Map<String, dynamic> map) {
    return EmployeePortalModel(
      isEmployeePortal: map['isEmployeePortal'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeePortalModel.fromJson(String source) =>
      EmployeePortalModel.fromMap(
        json.decode(source),
      );
}
