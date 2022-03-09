class CaseManagementModel {
  String? id;
  String? name;
  double? inProgress;
  double? draft;
  double? overDue;
  double? completed;
  String? templateCode;
  String? templateName;
  String? priority;
  String? categoryCode;
  double? count;
  String? day;
  double? violated;
  double? nonViolated;
  String? dueDate;

  CaseManagementModel({
    this.id,
    this.name,
    this.inProgress,
    this.draft,
    this.overDue,
    this.completed,
    this.templateCode,
    this.templateName,
    this.priority,
    this.categoryCode,
    this.count,
    this.day,
    this.violated,
    this.nonViolated,
    this.dueDate,
  });

  CaseManagementModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    inProgress = json['InProgress'];
    draft = json['Draft'];
    overDue = json['OverDue'];
    completed = json['Completed'];
    templateCode = json['TemplateCode'];
    templateName = json['TemplateName'];
    priority = json['Priority'];
    categoryCode = json['CategoryCode'];
    count = json['Count'];
    day = json['Day'];
    violated = json['Violated'];
    nonViolated = json['NonViolated'];
    dueDate = json['DueDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['InProgress'] = this.inProgress;
    data['Draft'] = this.draft;
    data['OverDue'] = this.overDue;
    data['Completed'] = this.completed;
    data['TemplateCode'] = this.templateCode;
    data['TemplateName'] = this.templateName;
    data['Priority'] = this.priority;
    data['CategoryCode'] = this.categoryCode;
    data['Count'] = this.count;
    data['Day'] = this.day;
    data['Violated'] = this.violated;
    data['NonViolated'] = this.nonViolated;
    data['DueDate'] = this.dueDate;
    return data;
  }
}
