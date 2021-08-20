class WorkspaceViewModel {
  String legalEntityName;
  String parentNoteId;
  String createdbyName;
  String workspaceName;
  String parentName;
  String noteSubject;
  String sequenceOrder;
  String legalEntityId;
  String createdBy;
  String documentTypeId;
  String workspaceId;
  String noteId;
  String documentTypeIds;
  String documentTypeNoteId;
  String id;
  String type;

  WorkspaceViewModel({
    this.legalEntityName,
    this.parentNoteId,
    this.createdbyName,
    this.workspaceName,
    this.parentName,
    this.noteSubject,
    this.sequenceOrder,
    this.legalEntityId,
    this.createdBy,
    this.documentTypeId,
    this.workspaceId,
    this.noteId,
    this.documentTypeIds,
    this.documentTypeNoteId,
    this.id,
    this.type,
  });

  WorkspaceViewModel.fromJson(Map<String, dynamic> json) {
    legalEntityName = json['legalEntityName'];
    parentNoteId = json['parentNoteId'];
    createdbyName = json['createdbyName'];
    workspaceName = json['workspaceName'];
    parentName = json['parentName'];
    noteSubject = json['noteSubject'];
    sequenceOrder = json['sequenceOrder'];
    legalEntityId = json['legalEntityId'];
    createdBy = json['createdBy'];
    documentTypeId = json['documentTypeId'];
    workspaceId = json['workspaceId'];
    noteId = json['noteId'];
    documentTypeIds = json['documentTypeIds'];
    documentTypeNoteId = json['documentTypeNoteId'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['legalEntityName'] = this.legalEntityName;
    data['parentNoteId'] = this.parentNoteId;
    data['createdbyName'] = this.createdbyName;
    data['workspaceName'] = this.workspaceName;
    data['parentName'] = this.parentName;
    data['noteSubject'] = this.noteSubject;
    data['sequenceOrder'] = this.sequenceOrder;
    data['legalEntityId'] = this.legalEntityId;
    data['createdBy'] = this.createdBy;
    data['documentTypeId'] = this.documentTypeId;
    data['workspaceId'] = this.workspaceId;
    data['noteId'] = this.noteId;
    data['documentTypeIds'] = this.documentTypeIds;
    data['documentTypeNoteId'] = this.documentTypeNoteId;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}
