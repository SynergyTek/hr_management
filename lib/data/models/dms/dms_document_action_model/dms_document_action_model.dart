class DMSDocumentActionModel {
  String id;
  dynamic name;
  String documentName;
  String createdDate;
  bool isArchived;
  dynamic documentId;
  String statusName;
  dynamic noteStatus;
  String documentType;
  String noteVersionNo;
  String parentId;
  String updatedDate;
  String uploadType;
  String folderPath;
  String updatedByUser;
  String noteId;
  bool permission;
  String photoId;
  String templatecode;
  dynamic tableMetadataId;
  dynamic maxNumber;

  DMSDocumentActionModel(
      {this.id,
      this.name,
      this.documentName,
      this.createdDate,
      this.isArchived,
      this.documentId,
      this.statusName,
      this.noteStatus,
      this.documentType,
      this.noteVersionNo,
      this.parentId,
      this.updatedDate,
      this.uploadType,
      this.folderPath,
      this.updatedByUser,
      this.noteId,
      this.permission,
      this.photoId,
      this.templatecode,
      this.tableMetadataId,
      this.maxNumber});

  DMSDocumentActionModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    documentName = json['DocumentName'];
    createdDate = json['CreatedDate'];
    isArchived = json['IsArchived'];
    documentId = json['DocumentId'];
    statusName = json['StatusName'];
    noteStatus = json['NoteStatus'];
    documentType = json['DocumentType'];
    noteVersionNo = json['NoteVersionNo'];
    parentId = json['ParentId'];
    updatedDate = json['UpdatedDate'];
    uploadType = json['UploadType'];
    folderPath = json['FolderPath'];
    updatedByUser = json['UpdatedByUser'];
    noteId = json['NoteId'];
    permission = json['Permission'];
    photoId = json['PhotoId'];
    templatecode = json['templatecode'];
    tableMetadataId = json['TableMetadataId'];
    maxNumber = json['maxNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['DocumentName'] = this.documentName;
    data['CreatedDate'] = this.createdDate;
    data['IsArchived'] = this.isArchived;
    data['DocumentId'] = this.documentId;
    data['StatusName'] = this.statusName;
    data['NoteStatus'] = this.noteStatus;
    data['DocumentType'] = this.documentType;
    data['NoteVersionNo'] = this.noteVersionNo;
    data['ParentId'] = this.parentId;
    data['UpdatedDate'] = this.updatedDate;
    data['UploadType'] = this.uploadType;
    data['FolderPath'] = this.folderPath;
    data['UpdatedByUser'] = this.updatedByUser;
    data['NoteId'] = this.noteId;
    data['Permission'] = this.permission;
    data['PhotoId'] = this.photoId;
    data['templatecode'] = this.templatecode;
    data['TableMetadataId'] = this.tableMetadataId;
    data['maxNumber'] = this.maxNumber;
    return data;
  }
}
