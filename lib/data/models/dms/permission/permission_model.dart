import 'dart:convert';

class Permission {
  String? userPermissionGroup;
  bool? disablePermissionInheritance;
  String? principal;
  String? workspaceId;
  String? parentId;
  String? documentName;
  bool? isDocument;
  String? referenceId;
  bool? isOwner;
  bool? isSelfWorkspace;
  bool? isWorkspaceAdmin;
  String? folderType;
  bool? canManagePermission;
  int? permissionType;
  int? access;
  int? appliesTo;
  String? noteId;
  String? ntsNote;
  String? permittedUserId;
  String? user;
  String? permittedUserGroupId;
  String? userGroup;
  bool? isowner;
  bool? isInherited;
  bool? isInheritedFromChild;
  String? inheritedFrom;
  String? id;
  String? createdDate;
  String? createdBy;
  String? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  int? sequenceOrder;
  String? companyId;
  String? legalEntityId;
  int? dataAction;
  int? status;
  int? versionNo;
  String? portalId;

  Permission(
      {this.userPermissionGroup,
      this.disablePermissionInheritance,
      this.principal,
      this.workspaceId,
      this.parentId,
      this.documentName,
      this.isDocument,
      this.referenceId,
      this.isOwner,
      this.isSelfWorkspace,
      this.isWorkspaceAdmin,
      this.folderType,
      this.canManagePermission,
      this.permissionType,
      this.access,
      this.appliesTo,
      this.noteId,
      this.ntsNote,
      this.permittedUserId,
      this.user,
      this.permittedUserGroupId,
      this.userGroup,
      this.isowner,
      this.isInherited,
      this.isInheritedFromChild,
      this.inheritedFrom,
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
      this.portalId});

  Permission.fromJson(Map<String, dynamic> json) {
    userPermissionGroup = json['UserPermissionGroup'];
    disablePermissionInheritance = json['DisablePermissionInheritance'];
    principal = json['Principal'];
    workspaceId = json['WorkspaceId'];
    parentId = json['ParentId'];
    documentName = json['DocumentName'];
    isDocument = json['IsDocument'];
    referenceId = json['ReferenceId'];
    isOwner = json['IsOwner'];
    isSelfWorkspace = json['IsSelfWorkspace'];
    isWorkspaceAdmin = json['IsWorkspaceAdmin'];
    folderType = json['FolderType'];
    canManagePermission = json['CanManagePermission'];
    permissionType = json['PermissionType'];
    access = json['Access'];
    appliesTo = json['AppliesTo'];
    noteId = json['NoteId'];
    ntsNote = json['NtsNote'];
    permittedUserId = json['PermittedUserId'];
    user = json['User'];
    permittedUserGroupId = json['PermittedUserGroupId'];
    userGroup = json['UserGroup'];
    isowner = json['Isowner'];
    isInherited = json['IsInherited'];
    isInheritedFromChild = json['IsInheritedFromChild'];
    inheritedFrom = json['InheritedFrom'];
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
    data['UserPermissionGroup'] = this.userPermissionGroup;
    data['DisablePermissionInheritance'] = this.disablePermissionInheritance;
    data['Principal'] = this.principal;
    data['WorkspaceId'] = this.workspaceId;
    data['ParentId'] = this.parentId;
    data['DocumentName'] = this.documentName;
    data['IsDocument'] = this.isDocument;
    data['ReferenceId'] = this.referenceId;
    data['IsOwner'] = this.isOwner;
    data['IsSelfWorkspace'] = this.isSelfWorkspace;
    data['IsWorkspaceAdmin'] = this.isWorkspaceAdmin;
    data['FolderType'] = this.folderType;
    data['CanManagePermission'] = this.canManagePermission;
    data['PermissionType'] = this.permissionType;
    data['Access'] = this.access;
    data['AppliesTo'] = this.appliesTo;
    data['NoteId'] = this.noteId;
    data['NtsNote'] = this.ntsNote;
    data['PermittedUserId'] = this.permittedUserId;
    data['User'] = this.user;
    data['PermittedUserGroupId'] = this.permittedUserGroupId;
    data['UserGroup'] = this.userGroup;
    data['Isowner'] = this.isowner;
    data['IsInherited'] = this.isInherited;
    data['IsInheritedFromChild'] = this.isInheritedFromChild;
    data['InheritedFrom'] = this.inheritedFrom;
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

PermissionSubmitModel permissionSubmitModelFromJson(String str) => PermissionSubmitModel.fromJson(json.decode(str));

String permissionSubmitModelToJson(PermissionSubmitModel data) => json.encode(data.toJson());

class PermissionSubmitModel {
    PermissionSubmitModel({
        this.permissionType,
        this.access,
        this.appliesTo,
        this.noteId,
        this.permittedUserId,
        this.permittedUserGroupId,
        this.id,
        this.legalEntityId,
        this.dataAction,
    });

    int? permissionType;
    int? access;
    int? appliesTo;
    String? noteId;
    dynamic permittedUserId;
    dynamic permittedUserGroupId;
    dynamic id;
    dynamic legalEntityId;
    String? dataAction;

    factory PermissionSubmitModel.fromJson(Map<String, dynamic> json) => PermissionSubmitModel(
        permissionType: json["PermissionType"],
        access: json["Access"],
        appliesTo: json["AppliesTo"],
        noteId: json["NoteId"],
        permittedUserId: json["PermittedUserId"],
        permittedUserGroupId: json["PermittedUserGroupId"],
        id: json["Id"],
        legalEntityId: json["LegalEntityId"],
        dataAction: json["DataAction"],
    );

    Map<String, dynamic> toJson() => {
        "PermissionType": permissionType,
        "Access": access,
        "AppliesTo": appliesTo,
        "NoteId": noteId,
        "PermittedUserId": permittedUserId,
        "PermittedUserGroupId": permittedUserGroupId,
        "Id": id,
        "LegalEntityId": legalEntityId,
        "DataAction": dataAction,
    };
}
