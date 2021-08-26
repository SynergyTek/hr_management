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
  List<String> documentTypeId;
  String workspaceId;
  String noteId;
  String documentTypeIds;
  String documentTypeNoteId;
  String id;
  String type;

  //
  String dataAction;
  String activeUserId;
  String ownerUserId;

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

    //
    this.dataAction,
    this.activeUserId,
    this.ownerUserId,
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
    documentTypeId = List<String>.from(json["documentTypeId"].map((x) => x));
    workspaceId = json['workspaceId'];
    noteId = json['noteId'];
    documentTypeIds = json['documentTypeIds'];
    documentTypeNoteId = json['documentTypeNoteId'];
    id = json['id'];
    type = json['type'];

    //
    dataAction = json['dataAction'];
    activeUserId = json['activeUserId'];
    ownerUserId = json['ownerUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LegalEntityName'] = this.legalEntityName;
    data['ParentNoteId'] = this.parentNoteId;
    data['CreatedbyName'] = this.createdbyName;
    data['WorkspaceName'] = this.workspaceName;
    data['ParentName'] = this.parentName;
    data['NoteSubject'] = this.noteSubject;
    data['SequenceOrder'] = this.sequenceOrder;
    data['LegalEntityId'] = this.legalEntityId;
    data['CreatedBy'] = this.createdBy;
    data['DocumentTypeId'] = this.documentTypeId;
    data['WorkspaceId'] = this.workspaceId;
    data['NoteId'] = this.noteId;
    data['DocumentTypeIds'] = this.documentTypeIds;
    data['DocumentTypeNoteId'] = this.documentTypeNoteId;
    data['Id'] = this.id;
    data['Type'] = this.type;

    //
    data['DataAction'] = this.dataAction;
    data['ActiveUserId'] = this.activeUserId;
    data['OwnerUserId'] = this.ownerUserId;

    return data;
  }
}
