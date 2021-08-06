class DocReqByHrModel {
  String documentType;
  String ownerName;
  String expiryDate;
  String issueDate;
  String templateCode;
  String serviceNo;
  String serviceId;
  String status;
  String fileId;
  String depNoteId;
  String noteNo;
  String noteId;
  int documentCount;
  String noteVersionNo;
  String attachVersionNo;
  String createdDate;

  DocReqByHrModel({
    this.documentType,
    this.ownerName,
    this.expiryDate,
    this.issueDate,
    this.templateCode,
    this.serviceNo,
    this.serviceId,
    this.status,
    this.fileId,
    this.depNoteId,
    this.noteNo,
    this.noteId,
    this.documentCount,
    this.noteVersionNo,
    this.attachVersionNo,
    this.createdDate,
  });

  DocReqByHrModel.fromJson(Map<String, dynamic> json) {
    documentType = json['DocumentType'];
    ownerName = json['OwnerName'];
    expiryDate = json['ExpiryDate'];
    issueDate = json['IssueDate'];
    templateCode = json['TemplateCode'];
    serviceNo = json['ServiceNo'];
    serviceId = json['ServiceId'];
    status = json['Status'];
    fileId = json['FileId'];
    depNoteId = json['DepNoteId'];
    noteNo = json['NoteNo'];
    noteId = json['NoteId'];
    documentCount = json['DocumentCount'];
    noteVersionNo = json['NoteVersionNo'];
    attachVersionNo = json['AttachVersionNo'];
    createdDate = json['CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocumentType'] = this.documentType;
    data['OwnerName'] = this.ownerName;
    data['ExpiryDate'] = this.expiryDate;
    data['IssueDate'] = this.issueDate;
    data['TemplateCode'] = this.templateCode;
    data['ServiceNo'] = this.serviceNo;
    data['ServiceId'] = this.serviceId;
    data['Status'] = this.status;
    data['FileId'] = this.fileId;
    data['DepNoteId'] = this.depNoteId;
    data['NoteNo'] = this.noteNo;
    data['NoteId'] = this.noteId;
    data['DocumentCount'] = this.documentCount;
    data['NoteVersionNo'] = this.noteVersionNo;
    data['AttachVersionNo'] = this.attachVersionNo;
    data['CreatedDate'] = this.createdDate;
    return data;
  }
}
