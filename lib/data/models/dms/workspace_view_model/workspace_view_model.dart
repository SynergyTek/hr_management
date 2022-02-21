class WorkspaceViewModel {
  String? legalEntityName;
  String? parentNoteId;
  String? createdbyName;
  String? workspaceName;
  String? parentName;
  String? noteSubject;
  String? sequenceOrder;
  String? legalEntityId;
  String? createdBy;
  List? documentTypeId;
  String? workspaceId;
  String? noteId;
  String? documentTypeIds;
  String? documentTypeNoteId;
  String? id;
  String? type;

  //
  String? dataAction;
  String? activeUserId;
  String? ownerUserId;

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
    legalEntityName = json['LegalEntityName'];
    parentNoteId = json['ParentNoteId'];
    createdbyName = json['CreatedbyName'];
    workspaceName = json['WorkspaceName'];
    parentName = json['ParentName'];
    noteSubject = json['NoteSubject'];
    sequenceOrder = json['SequenceOrder'].toString();
    legalEntityId = json['LegalEntityId'];
    createdBy = json['reatedBy'];
    if (json.containsKey('DocumentTypeId'))
      documentTypeId =
          (json['DocumentTypeId'] != null && json['DocumentTypeId'].isNotEmpty)
              ? json['DocumentTypeId']
              : [];
    workspaceId = json['WorkspaceId'];
    noteId = json['NoteId'];
    documentTypeIds = json['DocumentTypeIds'];
    documentTypeNoteId = json['DocumentTypeNoteId'];
    id = json['Id'];
    type = json['Type'];

    //
    dataAction = json['DataAction'].toString();
    activeUserId = json['ActiveUserId'].toString();
    ownerUserId = json['OwnerUserId'].toString();
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
