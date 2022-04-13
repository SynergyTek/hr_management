class Reimbursement {
  Reimbursement({
    this.eventDate,
    this.duration,
    this.location,
    this.reimbursementDetails,
    this.reimbursementAmount,
    this.status,
    this.statusCode,
    this.serviceNo,
    this.ntsNoteId,
    this.id,
    this.userId,
    this.dueDate,
    this.startDate,
    this.userName,
  });
  String? eventDate;
  int? duration;
  String? location;
  String? reimbursementDetails;
  int? reimbursementAmount;
  String? status;
  String? statusCode;
  String? serviceNo;
  String? ntsNoteId;
  String? id;
  String? userId;
  String? dueDate;
  String? startDate;
  String? userName;

  Reimbursement.fromJson(Map<String, dynamic> json) {
    eventDate = json['EventDate'];
    duration = json['Duration'];
    location = null;
    reimbursementDetails = json['ReimbursementDetails'];
    reimbursementAmount = json['ReimbursementAmount'];
    status = json['Status'];
    statusCode = null;
    serviceNo = json['ServiceNo'];
    ntsNoteId = json['NtsNoteId'];
    id = json['Id'];
    userId = null;
    dueDate = json['DueDate'];
    startDate = json['StartDate'];
    userName = json['UserName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['EventDate'] = eventDate;
    _data['Duration'] = duration;
    _data['Location'] = location;
    _data['ReimbursementDetails'] = reimbursementDetails;
    _data['ReimbursementAmount'] = reimbursementAmount;
    _data['Status'] = status;
    _data['StatusCode'] = statusCode;
    _data['ServiceNo'] = serviceNo;
    _data['NtsNoteId'] = ntsNoteId;
    _data['Id'] = id;
    _data['UserId'] = userId;
    _data['DueDate'] = dueDate;
    _data['StartDate'] = startDate;
    _data['UserName'] = userName;
    return _data;
  }
}
