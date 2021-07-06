import 'dart:convert';

class AccessLogModel {
  String deviceId;
  String biometricId;
  String punchingTime;
  String deviceName;
  int deviceMachineNo;
  String deviceIpAddress;
  int devicePortNo;
  String deviceSerialNo;
  int devicePunchingType;
  String devicePunchingTypeText;
  String userInfoId;
  String userId;
  String personId;
  String firstName;
  String middleName;
  String lastName;
  String punchingTimeArray;
  String accessLogText;
  String accessLogSource;
  String personFullName;
  String sponsorshipNo;
  String startDate;
  String endDate;
  String serviceNo;
  String serviceId;
  int signInType;
  String accessLogStatus;
  String serviceOwner;
  String signInLocation;
  String id;
  String createdDate;
  String createdBy;
  String lastUpdatedDate;
  String lastUpdatedBy;
  bool isDeleted;
  int sequenceOrder;
  String companyId;
  int dataAction;
  int status;
  int versionNo;

  AccessLogModel(
      {this.deviceId,
      this.biometricId,
      this.punchingTime,
      this.deviceName,
      this.deviceMachineNo,
      this.deviceIpAddress,
      this.devicePortNo,
      this.deviceSerialNo,
      this.devicePunchingType,
      this.devicePunchingTypeText,
      this.userInfoId,
      this.userId,
      this.personId,
      this.firstName,
      this.middleName,
      this.lastName,
      this.punchingTimeArray,
      this.accessLogText,
      this.accessLogSource,
      this.personFullName,
      this.sponsorshipNo,
      this.startDate,
      this.endDate,
      this.serviceNo,
      this.serviceId,
      this.signInType,
      this.accessLogStatus,
      this.serviceOwner,
      this.signInLocation,
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
      this.versionNo});

  AccessLogModel.fromJson(Map<String, dynamic> json) {
    deviceId = json['DeviceId'];
    biometricId = json['BiometricId'];
    punchingTime = json['PunchingTime'];
    deviceName = json['DeviceName'];
    deviceMachineNo = json['DeviceMachineNo'];
    deviceIpAddress = json['DeviceIpAddress'];
    devicePortNo = json['DevicePortNo'];
    deviceSerialNo = json['DeviceSerialNo'];
    devicePunchingType = json['DevicePunchingType'];
    devicePunchingTypeText = json['DevicePunchingTypeText'];
    userInfoId = json['UserInfoId'];
    userId = json['UserId'];
    personId = json['PersonId'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    punchingTimeArray = json['PunchingTimeArray'];
    accessLogText = json['AccessLogText'];
    accessLogSource = json['AccessLogSource'];
    personFullName = json['PersonFullName'];
    sponsorshipNo = json['SponsorshipNo'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    serviceNo = json['ServiceNo'];
    serviceId = json['ServiceId'];
    signInType = json['SignInType'];
    accessLogStatus = json['AccessLogStatus'];
    serviceOwner = json['ServiceOwner'];
    signInLocation = json['SignInLocation'];
    id = json['Id'];
    createdDate = json['CreatedDate'];
    createdBy = json['CreatedBy'];
    lastUpdatedDate = json['LastUpdatedDate'];
    lastUpdatedBy = json['LastUpdatedBy'];
    isDeleted = json['IsDeleted'];
    sequenceOrder = json['SequenceOrder'];
    companyId = json['CompanyId'];
    dataAction = json['DataAction'];
    status = json['Status'];
    versionNo = json['VersionNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DeviceId'] = this.deviceId;
    data['BiometricId'] = this.biometricId;
    data['PunchingTime'] = this.punchingTime;
    data['DeviceName'] = this.deviceName;
    data['DeviceMachineNo'] = this.deviceMachineNo;
    data['DeviceIpAddress'] = this.deviceIpAddress;
    data['DevicePortNo'] = this.devicePortNo;
    data['DeviceSerialNo'] = this.deviceSerialNo;
    data['DevicePunchingType'] = this.devicePunchingType;
    data['DevicePunchingTypeText'] = this.devicePunchingTypeText;
    data['UserInfoId'] = this.userInfoId;
    data['UserId'] = this.userId;
    data['PersonId'] = this.personId;
    data['FirstName'] = this.firstName;
    data['MiddleName'] = this.middleName;
    data['LastName'] = this.lastName;
    data['PunchingTimeArray'] = this.punchingTimeArray;
    data['AccessLogText'] = this.accessLogText;
    data['AccessLogSource'] = this.accessLogSource;
    data['PersonFullName'] = this.personFullName;
    data['SponsorshipNo'] = this.sponsorshipNo;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['ServiceNo'] = this.serviceNo;
    data['ServiceId'] = this.serviceId;
    data['SignInType'] = this.signInType;
    data['AccessLogStatus'] = this.accessLogStatus;
    data['ServiceOwner'] = this.serviceOwner;
    data['SignInLocation'] = this.signInLocation;
    data['Id'] = this.id;
    data['CreatedDate'] = this.createdDate;
    data['CreatedBy'] = this.createdBy;
    data['LastUpdatedDate'] = this.lastUpdatedDate;
    data['LastUpdatedBy'] = this.lastUpdatedBy;
    data['IsDeleted'] = this.isDeleted;
    data['SequenceOrder'] = this.sequenceOrder;
    data['CompanyId'] = this.companyId;
    data['DataAction'] = this.dataAction;
    data['Status'] = this.status;
    data['VersionNo'] = this.versionNo;
    return data;
  }
}
