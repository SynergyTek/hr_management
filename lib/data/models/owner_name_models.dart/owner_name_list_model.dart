import 'dart:convert';

List<OwnerNameListModel> ownerNameListModelFromJson(String str) => List<OwnerNameListModel>.from(json.decode(str).map((x) => OwnerNameListModel.fromJson(x)));

String ownerNameListModelToJson(List<OwnerNameListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OwnerNameListModel {
    OwnerNameListModel({
        this.id,
        this.status,
        this.operation,
        this.taskId,
        this.emailTaskId,
        this.taskNo,
        this.subject,
        this.startDate,
        this.dueDate,
        this.assignedToType,
        this.creationDate,
        this.completionDate,
        this.taskStatus,
        this.taskStatusId,
        this.mode,
        this.text,
        this.assignTo,
        this.moduleId,
        this.moduleName,
        this.moduleCode,
        this.userId,
        this.ownerName,
        this.assignedToUserName,
        this.userRole,
        this.serviceId,
        this.templateMasterCode,
        this.description,
        this.requestSource,
        this.layout,
        this.returnUrl,
        this.templateMasterId,
        this.ntsType,
        this.userfilter,
        this.projectfilter,
        this.days,
        this.actualSla,
        this.chartFilter,
        this.pieChartFilter,
        this.period,
        this.taskfilter,
        this.datefilter,
        this.datefilter1,
        this.userfilterCvr,
        this.moduleList,
        this.taskStatusIds,
        this.taskAssigneeIds,
        this.taskOwnerIds,
    });

    String? id;
    dynamic status;
    dynamic operation;
    dynamic taskId;
    dynamic emailTaskId;
    dynamic taskNo;
    dynamic subject;
    dynamic startDate;
    dynamic dueDate;
    dynamic assignedToType;
    dynamic creationDate;
    dynamic completionDate;
    dynamic taskStatus;
    dynamic taskStatusId;
    dynamic mode;
    dynamic text;
    dynamic assignTo;
    dynamic moduleId;
    dynamic moduleName;
    dynamic moduleCode;
    dynamic userId;
    String? ownerName;
    dynamic assignedToUserName;
    dynamic userRole;
    dynamic serviceId;
    dynamic templateMasterCode;
    dynamic description;
    dynamic requestSource;
    dynamic layout;
    dynamic returnUrl;
    dynamic templateMasterId;
    dynamic ntsType;
    dynamic userfilter;
    dynamic projectfilter;
    int? days;
    int? actualSla;
    int? chartFilter;
    int? pieChartFilter;
    dynamic period;
    dynamic taskfilter;
    dynamic datefilter;
    dynamic datefilter1;
    dynamic userfilterCvr;
    dynamic moduleList;
    dynamic taskStatusIds;
    dynamic taskAssigneeIds;
    dynamic taskOwnerIds;

    factory OwnerNameListModel.fromJson(Map<String, dynamic> json) => OwnerNameListModel(
        id: json["Id"] == null ? null : json["Id"],
        status: json["Status"],
        operation: json["Operation"],
        taskId: json["TaskId"],
        emailTaskId: json["EmailTaskId"],
        taskNo: json["TaskNo"],
        subject: json["Subject"],
        startDate: json["StartDate"],
        dueDate: json["DueDate"],
        assignedToType: json["AssignedToType"],
        creationDate: json["CreationDate"],
        completionDate: json["CompletionDate"],
        taskStatus: json["TaskStatus"],
        taskStatusId: json["TaskStatusId"],
        mode: json["Mode"],
        text: json["Text"],
        assignTo: json["AssignTo"],
        moduleId: json["ModuleId"],
        moduleName: json["ModuleName"],
        moduleCode: json["ModuleCode"],
        userId: json["UserId"],
        ownerName: json["OwnerName"] == null ? null : json["OwnerName"],
        assignedToUserName: json["AssignedToUserName"],
        userRole: json["UserRole"],
        serviceId: json["ServiceId"],
        templateMasterCode: json["TemplateMasterCode"],
        description: json["Description"],
        requestSource: json["RequestSource"],
        layout: json["Layout"],
        returnUrl: json["ReturnUrl"],
        templateMasterId: json["TemplateMasterId"],
        ntsType: json["NTSType"],
        userfilter: json["Userfilter"],
        projectfilter: json["Projectfilter"],
        days: json["Days"],
        actualSla: json["ActualSLA"],
        chartFilter: json["ChartFilter"],
        pieChartFilter: json["PieChartFilter"],
        period: json["Period"],
        taskfilter: json["Taskfilter"],
        datefilter: json["Datefilter"],
        datefilter1: json["Datefilter1"],
        userfilterCvr: json["UserfilterCVR"],
        moduleList: json["ModuleList"],
        taskStatusIds: json["TaskStatusIds"],
        taskAssigneeIds: json["TaskAssigneeIds"],
        taskOwnerIds: json["TaskOwnerIds"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Status": status,
        "Operation": operation,
        "TaskId": taskId,
        "EmailTaskId": emailTaskId,
        "TaskNo": taskNo,
        "Subject": subject,
        "StartDate": startDate,
        "DueDate": dueDate,
        "AssignedToType": assignedToType,
        "CreationDate": creationDate,
        "CompletionDate": completionDate,
        "TaskStatus": taskStatus,
        "TaskStatusId": taskStatusId,
        "Mode": mode,
        "Text": text,
        "AssignTo": assignTo,
        "ModuleId": moduleId,
        "ModuleName": moduleName,
        "ModuleCode": moduleCode,
        "UserId": userId,
        "OwnerName": ownerName == null ? null : ownerName,
        "AssignedToUserName": assignedToUserName,
        "UserRole": userRole,
        "ServiceId": serviceId,
        "TemplateMasterCode": templateMasterCode,
        "Description": description,
        "RequestSource": requestSource,
        "Layout": layout,
        "ReturnUrl": returnUrl,
        "TemplateMasterId": templateMasterId,
        "NTSType": ntsType,
        "Userfilter": userfilter,
        "Projectfilter": projectfilter,
        "Days": days,
        "ActualSLA": actualSla,
        "ChartFilter": chartFilter,
        "PieChartFilter": pieChartFilter,
        "Period": period,
        "Taskfilter": taskfilter,
        "Datefilter": datefilter,
        "Datefilter1": datefilter1,
        "UserfilterCVR": userfilterCvr,
        "ModuleList": moduleList,
        "TaskStatusIds": taskStatusIds,
        "TaskAssigneeIds": taskAssigneeIds,
        "TaskOwnerIds": taskOwnerIds,
    };
}
