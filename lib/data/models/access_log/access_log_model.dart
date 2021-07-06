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

  AccessLogModel({
    this.deviceId,
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
    this.versionNo,
  });

  Map<String, dynamic> toMap() {
    return {
      'deviceId': deviceId,
      'biometricId': biometricId,
      'punchingTime': punchingTime,
      'deviceName': deviceName,
      'deviceMachineNo': deviceMachineNo,
      'deviceIpAddress': deviceIpAddress,
      'devicePortNo': devicePortNo,
      'deviceSerialNo': deviceSerialNo,
      'devicePunchingType': devicePunchingType,
      'devicePunchingTypeText': devicePunchingTypeText,
      'userInfoId': userInfoId,
      'userId': userId,
      'personId': personId,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'punchingTimeArray': punchingTimeArray,
      'accessLogText': accessLogText,
      'accessLogSource': accessLogSource,
      'personFullName': personFullName,
      'sponsorshipNo': sponsorshipNo,
      'startDate': startDate,
      'endDate': endDate,
      'serviceNo': serviceNo,
      'serviceId': serviceId,
      'signInType': signInType,
      'accessLogStatus': accessLogStatus,
      'serviceOwner': serviceOwner,
      'signInLocation': signInLocation,
      'id': id,
      'createdDate': createdDate,
      'createdBy': createdBy,
      'lastUpdatedDate': lastUpdatedDate,
      'lastUpdatedBy': lastUpdatedBy,
      'isDeleted': isDeleted,
      'sequenceOrder': sequenceOrder,
      'companyId': companyId,
      'dataAction': dataAction,
      'status': status,
      'versionNo': versionNo,
    };
  }

  factory AccessLogModel.fromMap(Map<String, dynamic> map) {
    return AccessLogModel(
      deviceId: map['deviceId'],
      biometricId: map['biometricId'],
      punchingTime: map['punchingTime'],
      deviceName: map['deviceName'],
      deviceMachineNo: map['deviceMachineNo'],
      deviceIpAddress: map['deviceIpAddress'],
      devicePortNo: map['devicePortNo'],
      deviceSerialNo: map['deviceSerialNo'],
      devicePunchingType: map['devicePunchingType'],
      devicePunchingTypeText: map['devicePunchingTypeText'],
      userInfoId: map['userInfoId'],
      userId: map['userId'],
      personId: map['personId'],
      firstName: map['firstName'],
      middleName: map['middleName'],
      lastName: map['lastName'],
      punchingTimeArray: map['punchingTimeArray'],
      accessLogText: map['accessLogText'],
      accessLogSource: map['accessLogSource'],
      personFullName: map['personFullName'],
      sponsorshipNo: map['sponsorshipNo'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      serviceNo: map['serviceNo'],
      serviceId: map['serviceId'],
      signInType: map['signInType'],
      accessLogStatus: map['accessLogStatus'],
      serviceOwner: map['serviceOwner'],
      signInLocation: map['signInLocation'],
      id: map['id'],
      createdDate: map['createdDate'],
      createdBy: map['createdBy'],
      lastUpdatedDate: map['lastUpdatedDate'],
      lastUpdatedBy: map['lastUpdatedBy'],
      isDeleted: map['isDeleted'],
      sequenceOrder: map['sequenceOrder'],
      companyId: map['companyId'],
      dataAction: map['dataAction'],
      status: map['status'],
      versionNo: map['versionNo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AccessLogModel.fromJson(String source) =>
      AccessLogModel.fromMap(json.decode(source));
}
