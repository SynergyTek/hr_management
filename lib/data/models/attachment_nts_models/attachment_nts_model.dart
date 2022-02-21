class AttachmentNTSModel {
  String? contentByte;
  String? snapshotContentByte;
  String? createdDateDisplay;
  String? size;
  String? mediaNewType;
  String? fileName;
  String? fileExtension;
  String? contentType;
  int? contentLength;
  String? contentBase64;
  String? snapshotMongoId;
  String? path;
  String? attachmentType;
  String? linkId;
  String? attachmentDescription;
  bool? isFileViewableFormat;
  String? mongoFileId;
  String? annotationsText;
  String? fileExtractedText;
  int? referenceTypeCode;
  String? referenceTypeId;
  String? id;
  String? createdDate;
  String? createdBy;
  String? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  String? sequenceOrder;
  String? companyId;
  String? legalEntityId;
  int? dataAction;
  int? status;
  int? versionNo;
  String? portalId;

  AttachmentNTSModel({
    this.contentByte,
    this.snapshotContentByte,
    this.createdDateDisplay,
    this.size,
    this.mediaNewType,
    this.fileName,
    this.fileExtension,
    this.contentType,
    this.contentLength,
    this.contentBase64,
    this.snapshotMongoId,
    this.path,
    this.attachmentType,
    this.linkId,
    this.attachmentDescription,
    this.isFileViewableFormat,
    this.mongoFileId,
    this.annotationsText,
    this.fileExtractedText,
    this.referenceTypeCode,
    this.referenceTypeId,
    this.id,
    this.createdDate,
    this.createdBy,
    this.lastUpdatedDate,
    this.lastUpdatedBy,
    this.isDeleted,
    this.sequenceOrder,
    this.companyId,
    this.legalEntityId,
    this.dataAction,
    this.status,
    this.versionNo,
    this.portalId,
  });

  AttachmentNTSModel.fromJson(Map<String, dynamic> json) {
    contentByte = json['ContentByte'];
    snapshotContentByte = json['SnapshotContentByte'];
    createdDateDisplay = json['CreatedDateDisplay'];
    size = json['Size'];
    mediaNewType = json['MediaNewType'];
    fileName = json['FileName'];
    fileExtension = json['FileExtension'];
    contentType = json['ContentType'];
    contentLength = json['ContentLength'];
    contentBase64 = json['ContentBase64'];
    snapshotMongoId = json['SnapshotMongoId'];
    path = json['Path'];
    attachmentType = json['AttachmentType'];
    linkId = json['LinkId'];
    attachmentDescription = json['AttachmentDescription'];
    isFileViewableFormat = json['IsFileViewableFormat'];
    mongoFileId = json['MongoFileId'];
    annotationsText = json['AnnotationsText'];
    fileExtractedText = json['FileExtractedText'];
    referenceTypeCode = json['ReferenceTypeCode'];
    referenceTypeId = json['ReferenceTypeId'];
    id = json['Id'];
    createdDate = json['CreatedDate'];
    createdBy = json['CreatedBy'];
    lastUpdatedDate = json['LastUpdatedDate'];
    lastUpdatedBy = json['LastUpdatedBy'];
    isDeleted = json['IsDeleted'];
    sequenceOrder = json['SequenceOrder'];
    companyId = json['CompanyId'];
    legalEntityId = json['LegalEntityId'];
    dataAction = json['DataAction'];
    status = json['Status'];
    versionNo = json['VersionNo'];
    portalId = json['PortalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ContentByte'] = this.contentByte;
    data['SnapshotContentByte'] = this.snapshotContentByte;
    data['CreatedDateDisplay'] = this.createdDateDisplay;
    data['Size'] = this.size;
    data['MediaNewType'] = this.mediaNewType;
    data['FileName'] = this.fileName;
    data['FileExtension'] = this.fileExtension;
    data['ContentType'] = this.contentType;
    data['ContentLength'] = this.contentLength;
    data['ContentBase64'] = this.contentBase64;
    data['SnapshotMongoId'] = this.snapshotMongoId;
    data['Path'] = this.path;
    data['AttachmentType'] = this.attachmentType;
    data['LinkId'] = this.linkId;
    data['AttachmentDescription'] = this.attachmentDescription;
    data['IsFileViewableFormat'] = this.isFileViewableFormat;
    data['MongoFileId'] = this.mongoFileId;
    data['AnnotationsText'] = this.annotationsText;
    data['FileExtractedText'] = this.fileExtractedText;
    data['ReferenceTypeCode'] = this.referenceTypeCode;
    data['ReferenceTypeId'] = this.referenceTypeId;
    data['Id'] = this.id;
    data['CreatedDate'] = this.createdDate;
    data['CreatedBy'] = this.createdBy;
    data['LastUpdatedDate'] = this.lastUpdatedDate;
    data['LastUpdatedBy'] = this.lastUpdatedBy;
    data['IsDeleted'] = this.isDeleted;
    data['SequenceOrder'] = this.sequenceOrder;
    data['CompanyId'] = this.companyId;
    data['LegalEntityId'] = this.legalEntityId;
    data['DataAction'] = this.dataAction;
    data['Status'] = this.status;
    data['VersionNo'] = this.versionNo;
    data['PortalId'] = this.portalId;
    return data;
  }
}
