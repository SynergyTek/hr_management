// import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'note.g.dart';

// @JsonSerializable()
class Note {
  int ntsNoteOwnerType;
  String noteStatusCode;
  bool isDraftButtonVisible;
  bool isSubmitButtonVisible;
  bool isSubjectRequired;
  bool isSubjectEditable;
  bool isDescriptionRequired;
  bool isDescriptionEditable;
  bool isRequiredTextBoxDisplay1;
  bool isAssigneeAvailableTextBoxDisplay1;
  bool isRequiredDropdownDisplay1;
  bool isAssigneeAvailableDropdownDisplay1;
  bool isRequiredTextBoxDisplay2;
  bool isAssigneeAvailableTextBoxDisplay2;
  bool isRequiredDropdownDisplay2;
  bool isAssigneeAvailableDropdownDisplay2;
  bool isRequiredTextBoxDisplay3;
  bool isAssigneeAvailableTextBoxDisplay3;
  bool isRequiredDropdownDisplay3;
  bool isAssigneeAvailableDropdownDisplay3;
  bool isRequiredTextBoxDisplay4;
  bool isAssigneeAvailableTextBoxDisplay4;
  bool isRequiredDropdownDisplay4;
  bool isAssigneeAvailableDropdownDisplay4;
  bool isRequiredTextBoxDisplay5;
  bool isAssigneeAvailableTextBoxDisplay5;
  bool isRequiredDropdownDisplay5;
  bool isAssigneeAvailableDropdownDisplay5;
  bool isRequiredTextBoxDisplay6;
  bool isAssigneeAvailableTextBoxDisplay6;
  bool isRequiredDropdownDisplay6;
  bool isAssigneeAvailableDropdownDisplay6;
  bool isRequiredTextBoxDisplay7;
  bool isAssigneeAvailableTextBoxDisplay7;
  bool isRequiredDropdownDisplay7;
  bool isAssigneeAvailableDropdownDisplay7;
  bool isRequiredTextBoxDisplay8;
  bool isAssigneeAvailableTextBoxDisplay8;
  bool isRequiredDropdownDisplay8;
  bool isAssigneeAvailableDropdownDisplay8;
  bool isRequiredTextBoxDisplay9;
  bool isAssigneeAvailableTextBoxDisplay9;
  bool isRequiredDropdownDisplay9;
  bool isAssigneeAvailableDropdownDisplay9;
  bool isRequiredTextBoxDisplay10;
  bool isAssigneeAvailableTextBoxDisplay10;
  bool isRequiredDropdownDisplay10;
  bool isAssigneeAvailableDropdownDisplay10;
  bool draftButton;
  bool createNewVersionButton;
  bool saveNewVersionButton;
  bool saveButton;
  bool canViewVersions;
  bool saveChangesButton;
  bool completeButton;
  bool isCompleteReasonRequired;
  bool rejectButton;
  bool notApplicableButton;
  bool isLockVisible;
  bool isReleaseVisible;
  bool isNoteTeamOwner;
  bool isRejectionReasonRequired;
  bool returnButton;
  bool isReturnReasonRequired;
  bool delegateButton;
  bool isDelegateReasonRequired;
  bool cancelButton;
  bool isCancelReasonRequired;
  bool backButton;
  bool closeButton;
  bool canEditHeader;
  String ownerUserName;
  String requestedByUserName;
  String createdByUserName;
  String lastUpdatedByUserName;
  String noteStatusName;
  String statusClass;
  String noteNo;
  String noteSubject;
  String noteDescription;
  String templateCode;
  DateTime startDate;
  DateTime completedDate;
  String noteStatusId;
  String notePriorityId;
  String templateId;
  String noteTemplateId;
  String requestedByUserId;
  String ownerUserId;
  bool isVersioning;
  String id;
  DateTime createdDate;
  String createdBy;
  DateTime lastUpdatedDate;
  String lastUpdatedBy;
  bool isDeleted;
  String companyId;
  int dataAction;
  int status;
  int versionNo;

  
  Note();

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  Map<String, dynamic> toJson() => _$NoteToJson(this);

  Note toEntity() {
    return Note();
  }
}

class NoteResponse {
  final List<Note> data;
  final String error;

  NoteResponse({
    @required this.data,
    @required this.error,
  });

  NoteResponse.fromJson(Map<String, dynamic> json)
      : data = (json["results"] as List)
            .map((i) => new Note.fromJson(i))
            .toList(),
        error = "";

  NoteResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
