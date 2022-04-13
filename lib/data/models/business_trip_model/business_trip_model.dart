class BusinessTripModel {
  String? userId;
  String? id;
  String? employeeName;
  String? purpose;
  String? businessTripStartDate;
  String? businessTripEndDate;
  String? status;
  String? statusCode;
  int? versionNo;
  int? sequenceOrder;
  String? startDate;
  String? serviceNo;
  String? ntsNoteId;
  String? claimServiceId;
  String? claimServiceNo;

  BusinessTripModel(
      {this.userId,
      this.id,
      this.employeeName,
      this.purpose,
      this.businessTripStartDate,
      this.businessTripEndDate,
      this.status,
      this.statusCode,
      this.versionNo,
      this.sequenceOrder,
      this.startDate,
      this.serviceNo,
      this.ntsNoteId,
      this.claimServiceId,
      this.claimServiceNo});

  BusinessTripModel.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    id = json['Id'];
    employeeName = json['EmployeeName'];
    purpose = json['Purpose'];
    businessTripStartDate = json['BusinessTripStartDate'];
    businessTripEndDate = json['BusinessTripEndDate'];
    status = json['Status'];
    statusCode = json['StatusCode'];
    versionNo = json['VersionNo'];
    sequenceOrder = json['SequenceOrder'];
    startDate = json['StartDate'];
    serviceNo = json['ServiceNo'];
    ntsNoteId = json['NtsNoteId'];
    claimServiceId = json['ClaimServiceId'];
    claimServiceNo = json['ClaimServiceNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['Id'] = this.id;
    data['EmployeeName'] = this.employeeName;
    data['Purpose'] = this.purpose;
    data['BusinessTripStartDate'] = this.businessTripStartDate;
    data['BusinessTripEndDate'] = this.businessTripEndDate;
    data['Status'] = this.status;
    data['StatusCode'] = this.statusCode;
    data['VersionNo'] = this.versionNo;
    data['SequenceOrder'] = this.sequenceOrder;
    data['StartDate'] = this.startDate;
    data['ServiceNo'] = this.serviceNo;
    data['NtsNoteId'] = this.ntsNoteId;
    data['ClaimServiceId'] = this.claimServiceId;
    data['ClaimServiceNo'] = this.claimServiceNo;
    return data;
  }
}
