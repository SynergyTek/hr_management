class ChartModel {
  String? id;
  String? type;
  String? code;
  int? value;
  String? type1;
  int? count1;
  int? count2;
  String? projectId;
  String? projectName;
  String? projectStartDate;
  String? assigneeId;
  String? taskCreatedDate;
  int? days;
  int? actualSLA;
  String? groupName;

  ChartModel(
      {this.id,
      this.type,
      this.code,
      this.value,
      this.type1,
      this.count1,
      this.count2,
      this.projectId,
      this.projectName,
      this.projectStartDate,
      this.assigneeId,
      this.taskCreatedDate,
      this.days,
      this.actualSLA,
      this.groupName});

  ChartModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    type = json['Type'];
    code = json['Code'];
    value = json['Value'];
    type1 = json['Type1'];
    count1 = json['Count1'];
    count2 = json['Count2'];
    projectId = json['ProjectId'];
    projectName = json['ProjectName'];
    projectStartDate = json['ProjectStartDate'];
    assigneeId = json['AssigneeId'];
    taskCreatedDate = json['TaskCreatedDate'];
    days = json['Days'];
    actualSLA = json['ActualSLA'];
    groupName = json['GroupName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Type'] = this.type;
    data['Code'] = this.code;
    data['Value'] = this.value;
    data['Type1'] = this.type1;
    data['Count1'] = this.count1;
    data['Count2'] = this.count2;
    data['ProjectId'] = this.projectId;
    data['ProjectName'] = this.projectName;
    data['ProjectStartDate'] = this.projectStartDate;
    data['AssigneeId'] = this.assigneeId;
    data['TaskCreatedDate'] = this.taskCreatedDate;
    data['Days'] = this.days;
    data['ActualSLA'] = this.actualSLA;
    data['GroupName'] = this.groupName;
    return data;
  }
}