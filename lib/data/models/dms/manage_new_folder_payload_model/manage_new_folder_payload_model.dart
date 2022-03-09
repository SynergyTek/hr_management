class ManageNewFolderPayloadModel {
  String? dataAction;
  String? noteSubject;
  String? sequenceOrder;
  String? parentNoteId;
  String? activeUserId;
  String? ownerUserId;

  String? id;

  ManageNewFolderPayloadModel({
    this.dataAction,
    this.noteSubject,
    this.sequenceOrder,
    this.parentNoteId,
    this.activeUserId,
    this.ownerUserId,
    this.id,
  });

  ManageNewFolderPayloadModel.fromJson(Map<String, dynamic> json) {
    dataAction = json['DataAction'];
    noteSubject = json['NoteSubject'];
    sequenceOrder = json['SequenceOrder'];
    parentNoteId = json['ParentNoteId'];
    activeUserId = json['ActiveUserId'];
    ownerUserId = json['OwnerUserId'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DataAction'] = this.dataAction;
    data['NoteSubject'] = this.noteSubject;
    data['SequenceOrder'] = this.sequenceOrder;
    data['ParentNoteId'] = this.parentNoteId;
    data['ActiveUserId'] = this.activeUserId;
    data['OwnerUserId'] = this.ownerUserId;
    data['Id'] = this.id;
    return data;
  }
}
