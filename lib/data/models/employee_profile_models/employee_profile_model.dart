import 'dart:convert';

EmployeeProfileModel employeeProfileModelFromJson(String str) =>
    EmployeeProfileModel.fromJson(json.decode(str));

String employeeProfileModelToJson(EmployeeProfileModel data) =>
    json.encode(data.toJson());

class EmployeeProfileModel {
  EmployeeProfileModel({
    this.personId,
    this.userId,
    this.userRole,
    this.positionId,
    this.personNo,
    this.title,
    this.gender,
    this.nationalityName,
    this.maritalStatus,
    this.religion,
    this.birthTown,
    this.birthCountryName,
    this.dateOfBirth,
    this.personalEmail,
    this.personFullName,
    this.locationName,
    this.gradeName,
    this.organizationName,
    this.jobName,
    this.positionName,
    this.assignmentTypeName,
    this.dateOfJoin,
    this.personTypeName,
    this.photoName,
    this.base64Img,
    this.assignmentStatusName,
    this.page,
    this.dependentId,
    this.mobile,
    this.presentUnitNumber,
    this.presentBuildingNumber,
    this.presentStreetName,
    this.presentCity,
    this.presentPostalCode,
    this.presentAdditionalNumber,
    this.presentConutryId,
    this.presentCountryName,
    this.homeUnitNumber,
    this.homeBuildingNumber,
    this.homeStreetName,
    this.homeCity,
    this.homePostalCode,
    this.homeAdditionalNumber,
    this.homeConutryId,
    this.homeCountryName,
    this.emergencyContactName1,
    this.emergencyContactNo1,
    this.relationship1,
    this.otherRelation1,
    this.emergencyContactName2,
    this.emergencyContactNo2,
    this.relationship2,
    this.otherRelation2,
    this.contactConutryId,
    this.contactCountryName,
    this.contactCountryCode,
    this.contactCountryDialCode,
    this.emergencyContactConutryId1,
    this.emergencyContactCountryName1,
    this.emergencyContactConutryCode1,
    this.emergencyContactCountryDialCode1,
    this.emergencyContactConutryId2,
    this.emergencyContactCountryName2,
    this.emergencyContactConutryCode2,
    this.emergencyContactCountryDialCode2,
    this.noteTableRows,
    this.templateId,
    this.id,
    this.createdDate,
    this.createdBy,
    this.lastUpdatedDate,
    this.lastUpdatedBy,
    this.isDeleted,
    this.sequenceOrder,
    this.companyId,
    this.dataAction,
    this.status,
    this.versionNo,
  });

  String? personId;
  String? userId;
  dynamic userRole;
  dynamic positionId;
  String? personNo;
  String? title;
  int? gender;
  String? nationalityName;
  int? maritalStatus;
  String? religion;
  dynamic birthTown;
  dynamic birthCountryName;
  DateTime? dateOfBirth;
  String? personalEmail;
  String? personFullName;
  String? locationName;
  String? gradeName;
  String? organizationName;
  String? jobName;
  String? positionName;
  String? assignmentTypeName;
  DateTime? dateOfJoin;
  dynamic personTypeName;
  String? photoName;
  dynamic base64Img;
  dynamic assignmentStatusName;
  dynamic page;
  dynamic dependentId;
  String? mobile;
  String? presentUnitNumber;
  String? presentBuildingNumber;
  String? presentStreetName;
  String? presentCity;
  String? presentPostalCode;
  String? presentAdditionalNumber;
  dynamic presentConutryId;
  String? presentCountryName;
  String? homeUnitNumber;
  String? homeBuildingNumber;
  String? homeStreetName;
  String? homeCity;
  String? homePostalCode;
  String? homeAdditionalNumber;
  dynamic homeConutryId;
  String? homeCountryName;
  String? emergencyContactName1;
  String? emergencyContactNo1;
  String? relationship1;
  dynamic otherRelation1;
  String? emergencyContactName2;
  String? emergencyContactNo2;
  String? relationship2;
  dynamic otherRelation2;
  dynamic contactConutryId;
  String? contactCountryName;
  dynamic contactCountryCode;
  String? contactCountryDialCode;
  dynamic emergencyContactConutryId1;
  String? emergencyContactCountryName1;
  dynamic emergencyContactConutryCode1;
  String? emergencyContactCountryDialCode1;
  dynamic emergencyContactConutryId2;
  String? emergencyContactCountryName2;
  dynamic emergencyContactConutryCode2;
  String? emergencyContactCountryDialCode2;
  dynamic noteTableRows;
  dynamic templateId;
  String? id;
  DateTime? createdDate;
  String? createdBy;
  DateTime? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  int? sequenceOrder;
  String? companyId;
  int? dataAction;
  int? status;
  int? versionNo;

  factory EmployeeProfileModel.fromJson(Map<String, dynamic> json) =>
      EmployeeProfileModel(
        personId: json["PersonId"],
        userId: json["UserId"],
        userRole: json["UserRole"],
        positionId: json["PositionId"],
        personNo: json["PersonNo"],
        title: json["Title"],
        gender: json["Gender"],
        nationalityName: json["NationalityName"],
        maritalStatus: json["MaritalStatus"],
        religion: json["Religion"],
        birthTown: json["BirthTown"],
        birthCountryName: json["BirthCountryName"],
        dateOfBirth: DateTime.parse(json["DateOfBirth"]),
        personalEmail: json["PersonalEmail"],
        personFullName: json["PersonFullName"],
        locationName: json["LocationName"],
        gradeName: json["GradeName"],
        organizationName: json["OrganizationName"],
        jobName: json["JobName"],
        positionName: json["PositionName"],
        assignmentTypeName: json["AssignmentTypeName"],
        dateOfJoin: DateTime.parse(json["DateOfJoin"]),
        personTypeName: json["PersonTypeName"],
        photoName: json["PhotoName"],
        base64Img: json["base64Img"],
        assignmentStatusName: json["AssignmentStatusName"],
        page: json["Page"],
        dependentId: json["DependentId"],
        mobile: json["Mobile"],
        presentUnitNumber: json["PresentUnitNumber"],
        presentBuildingNumber: json["PresentBuildingNumber"],
        presentStreetName: json["PresentStreetName"],
        presentCity: json["PresentCity"],
        presentPostalCode: json["PresentPostalCode"],
        presentAdditionalNumber: json["PresentAdditionalNumber"],
        presentConutryId: json["PresentConutryId"],
        presentCountryName: json["PresentCountryName"],
        homeUnitNumber: json["HomeUnitNumber"],
        homeBuildingNumber: json["HomeBuildingNumber"],
        homeStreetName: json["HomeStreetName"],
        homeCity: json["HomeCity"],
        homePostalCode: json["HomePostalCode"],
        homeAdditionalNumber: json["HomeAdditionalNumber"],
        homeConutryId: json["HomeConutryId"],
        homeCountryName: json["HomeCountryName"],
        emergencyContactName1: json["EmergencyContactName1"],
        emergencyContactNo1: json["EmergencyContactNo1"],
        relationship1: json["Relationship1"],
        otherRelation1: json["OtherRelation1"],
        emergencyContactName2: json["EmergencyContactName2"],
        emergencyContactNo2: json["EmergencyContactNo2"],
        relationship2: json["Relationship2"],
        otherRelation2: json["OtherRelation2"],
        contactConutryId: json["ContactConutryId"],
        contactCountryName: json["ContactCountryName"],
        contactCountryCode: json["ContactCountryCode"],
        contactCountryDialCode: json["ContactCountryDialCode"],
        emergencyContactConutryId1: json["EmergencyContactConutryId1"],
        emergencyContactCountryName1: json["EmergencyContactCountryName1"],
        emergencyContactConutryCode1: json["EmergencyContactConutryCode1"],
        emergencyContactCountryDialCode1:
            json["EmergencyContactCountryDialCode1"],
        emergencyContactConutryId2: json["EmergencyContactConutryId2"],
        emergencyContactCountryName2: json["EmergencyContactCountryName2"],
        emergencyContactConutryCode2: json["EmergencyContactConutryCode2"],
        emergencyContactCountryDialCode2:
            json["EmergencyContactCountryDialCode2"],
        noteTableRows: json["NoteTableRows"],
        templateId: json["TemplateId"],
        id: json["Id"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        createdBy: json["CreatedBy"],
        lastUpdatedDate: DateTime.parse(json["LastUpdatedDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
        isDeleted: json["IsDeleted"],
        sequenceOrder: json["SequenceOrder"],
        companyId: json["CompanyId"],
        dataAction: json["DataAction"],
        status: json["Status"],
        versionNo: json["VersionNo"],
      );

  Map<String, dynamic> toJson() => {
        "PersonId": personId,
        "UserId": userId,
        "UserRole": userRole,
        "PositionId": positionId,
        "PersonNo": personNo,
        "Title": title,
        "Gender": gender,
        "NationalityName": nationalityName,
        "MaritalStatus": maritalStatus,
        "Religion": religion,
        "BirthTown": birthTown,
        "BirthCountryName": birthCountryName,
        "DateOfBirth": dateOfBirth!.toIso8601String(),
        "PersonalEmail": personalEmail,
        "PersonFullName": personFullName,
        "LocationName": locationName,
        "GradeName": gradeName,
        "OrganizationName": organizationName,
        "JobName": jobName,
        "PositionName": positionName,
        "AssignmentTypeName": assignmentTypeName,
        "DateOfJoin": dateOfJoin!.toIso8601String(),
        "PersonTypeName": personTypeName,
        "PhotoName": photoName,
        "base64Img": base64Img,
        "AssignmentStatusName": assignmentStatusName,
        "Page": page,
        "DependentId": dependentId,
        "Mobile": mobile,
        "PresentUnitNumber": presentUnitNumber,
        "PresentBuildingNumber": presentBuildingNumber,
        "PresentStreetName": presentStreetName,
        "PresentCity": presentCity,
        "PresentPostalCode": presentPostalCode,
        "PresentAdditionalNumber": presentAdditionalNumber,
        "PresentConutryId": presentConutryId,
        "PresentCountryName": presentCountryName,
        "HomeUnitNumber": homeUnitNumber,
        "HomeBuildingNumber": homeBuildingNumber,
        "HomeStreetName": homeStreetName,
        "HomeCity": homeCity,
        "HomePostalCode": homePostalCode,
        "HomeAdditionalNumber": homeAdditionalNumber,
        "HomeConutryId": homeConutryId,
        "HomeCountryName": homeCountryName,
        "EmergencyContactName1": emergencyContactName1,
        "EmergencyContactNo1": emergencyContactNo1,
        "Relationship1": relationship1,
        "OtherRelation1": otherRelation1,
        "EmergencyContactName2": emergencyContactName2,
        "EmergencyContactNo2": emergencyContactNo2,
        "Relationship2": relationship2,
        "OtherRelation2": otherRelation2,
        "ContactConutryId": contactConutryId,
        "ContactCountryName": contactCountryName,
        "ContactCountryCode": contactCountryCode,
        "ContactCountryDialCode": contactCountryDialCode,
        "EmergencyContactConutryId1": emergencyContactConutryId1,
        "EmergencyContactCountryName1": emergencyContactCountryName1,
        "EmergencyContactConutryCode1": emergencyContactConutryCode1,
        "EmergencyContactCountryDialCode1": emergencyContactCountryDialCode1,
        "EmergencyContactConutryId2": emergencyContactConutryId2,
        "EmergencyContactCountryName2": emergencyContactCountryName2,
        "EmergencyContactConutryCode2": emergencyContactConutryCode2,
        "EmergencyContactCountryDialCode2": emergencyContactCountryDialCode2,
        "NoteTableRows": noteTableRows,
        "TemplateId": templateId,
        "Id": id,
        "CreatedDate": createdDate!.toIso8601String(),
        "CreatedBy": createdBy,
        "LastUpdatedDate": lastUpdatedDate!.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "IsDeleted": isDeleted,
        "SequenceOrder": sequenceOrder,
        "CompanyId": companyId,
        "DataAction": dataAction,
        "Status": status,
        "VersionNo": versionNo,
      };
}
