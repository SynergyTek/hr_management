class DMSDocumentActionModel {
  String? id;
  dynamic name;
  String? documentName;
  String? createdDate;
  bool? isArchived;
  dynamic documentId;
  String? statusName;
  dynamic noteStatus;
  String? documentType;
  String? noteVersionNo;
  String? parentId;
  String? updatedDate;
  String? uploadType;
  String? folderPath;
  String? updatedByUser;
  String? noteId;
  bool? permission;
  String? photoId;
  String? templatecode;
  dynamic tableMetadataId;
  dynamic maxNumber;
  String? folderCode;
  Null workspaceId;
  bool? isSelfWorkspace;
  bool? isWorkspaceAdmin;
  bool? isAssignedWorkspace;
  Null folderType;
  Null permissionType;
  Null access;
  Null inheritedFrom;
  Null appliesTo;
  Null ownerUserId;
  bool? isOwner;
  String? parentName;
  int? docCount;
  Null disablePermissionInheritance;
  Null description;
  Null lockStatus;
  Null title;
  String? templateMasterCode;
  Null templateMasterId;
  Null documentTypeId;
  String? fileName;
  Null ownerUser;
  Null createdByUser;
  Null serviceId;
  Null workflowNo;
  Null workflowName;
  Null workflowStatus;
  Null workflowTemplateId;
  Null sequenceNo;
  Null noteNo;
  bool? canOpen;
  bool? showMenu;
  bool? canCreateSubFolder;
  bool? canRename;
  bool? canShare;
  bool? canMove;
  bool? canCopy;
  bool? canArchive;
  bool? canDelete;
  bool? canSeeDetail;
  bool? canManagePermission;
  Null createdBy;
  String? lastUpdatedDate;
  Null lastUpdatedBy;
  bool? isDeleted;
  Null sequenceOrder;
  Null companyId;
  int? dataAction;
  int? status;
  int? versionNo;

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
      this.maxNumber,
      this.folderCode,
      this.workspaceId,
      this.isSelfWorkspace,
      this.isWorkspaceAdmin,
      this.isAssignedWorkspace,
      this.folderType,
      this.permissionType,
      this.access,
      this.inheritedFrom,
      this.appliesTo,
      this.ownerUserId,
      this.isOwner,
      this.parentName,
      this.docCount,
      this.disablePermissionInheritance,
      this.description,
      this.lockStatus,
      this.title,
      this.templateMasterCode,
      this.templateMasterId,
      this.documentTypeId,
      this.fileName,
      this.ownerUser,
      this.createdByUser,
      this.serviceId,
      this.workflowNo,
      this.workflowName,
      this.workflowStatus,
      this.workflowTemplateId,
      this.sequenceNo,
      this.noteNo,
      this.canOpen,
      this.showMenu,
      this.canCreateSubFolder,
      this.canRename,
      this.canShare,
      this.canMove,
      this.canCopy,
      this.canArchive,
      this.canDelete,
      this.canSeeDetail,
      this.canManagePermission,
      this.createdBy,
      this.lastUpdatedDate,
      this.lastUpdatedBy,
      this.isDeleted,
      this.sequenceOrder,
      this.companyId,
      this.dataAction,
      this.status,
      this.versionNo});

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
    folderCode = json['FolderCode'];
    workspaceId = json['WorkspaceId'];
    isSelfWorkspace = json['IsSelfWorkspace'];
    isWorkspaceAdmin = json['IsWorkspaceAdmin'];
    isAssignedWorkspace = json['IsAssignedWorkspace'];
    folderType = json['FolderType'];
    permissionType = json['PermissionType'];
    access = json['Access'];
    inheritedFrom = json['InheritedFrom'];
    appliesTo = json['AppliesTo'];
    ownerUserId = json['OwnerUserId'];
    isOwner = json['IsOwner'];
    parentName = json['ParentName'];
    docCount = json['DocCount'];
    disablePermissionInheritance = json['DisablePermissionInheritance'];
    description = json['Description'];
    lockStatus = json['LockStatus'];
    title = json['Title'];
    templateMasterCode = json['TemplateMasterCode'];
    templateMasterId = json['TemplateMasterId'];
    documentTypeId = json['DocumentTypeId'];
    fileName = json['FileName'];
    ownerUser = json['OwnerUser'];
    createdByUser = json['CreatedByUser'];
    serviceId = json['ServiceId'];
    workflowNo = json['WorkflowNo'];
    workflowName = json['WorkflowName'];
    workflowStatus = json['WorkflowStatus'];
    workflowTemplateId = json['WorkflowTemplateId'];
    sequenceNo = json['SequenceNo'];
    noteNo = json['NoteNo'];
    canOpen = json['CanOpen'];
    showMenu = json['ShowMenu'];
    canCreateSubFolder = json['CanCreateSubFolder'];
    canRename = json['CanRename'];
    canShare = json['CanShare'];
    canMove = json['CanMove'];
    canCopy = json['CanCopy'];
    canArchive = json['CanArchive'];
    canDelete = json['CanDelete'];
    canSeeDetail = json['CanSeeDetail'];
    canManagePermission = json['CanManagePermission'];
    createdBy = json['CreatedBy'];
    lastUpdatedDate = json['LastUpdatedDate'];
    lastUpdatedBy = json['LastUpdatedBy'];
    isDeleted = json['IsDeleted'];
    sequenceOrder = json['SequenceOrder'];
    companyId = json['CompanyId'];
    dataAction = json['DataAction'];
    status = json['Status'];
    versionNo = json['VersionNo'];
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
    data['FolderCode'] = this.folderCode;
    data['WorkspaceId'] = this.workspaceId;
    data['IsSelfWorkspace'] = this.isSelfWorkspace;
    data['IsWorkspaceAdmin'] = this.isWorkspaceAdmin;
    data['IsAssignedWorkspace'] = this.isAssignedWorkspace;
    data['FolderType'] = this.folderType;
    data['PermissionType'] = this.permissionType;
    data['Access'] = this.access;
    data['InheritedFrom'] = this.inheritedFrom;
    data['AppliesTo'] = this.appliesTo;
    data['OwnerUserId'] = this.ownerUserId;
    data['IsOwner'] = this.isOwner;
    data['ParentName'] = this.parentName;
    data['DocCount'] = this.docCount;
    data['DisablePermissionInheritance'] = this.disablePermissionInheritance;
    data['Description'] = this.description;
    data['LockStatus'] = this.lockStatus;
    data['Title'] = this.title;
    data['TemplateMasterCode'] = this.templateMasterCode;
    data['TemplateMasterId'] = this.templateMasterId;
    data['DocumentTypeId'] = this.documentTypeId;
    data['FileName'] = this.fileName;
    data['OwnerUser'] = this.ownerUser;
    data['CreatedByUser'] = this.createdByUser;
    data['ServiceId'] = this.serviceId;
    data['WorkflowNo'] = this.workflowNo;
    data['WorkflowName'] = this.workflowName;
    data['WorkflowStatus'] = this.workflowStatus;
    data['WorkflowTemplateId'] = this.workflowTemplateId;
    data['SequenceNo'] = this.sequenceNo;
    data['NoteNo'] = this.noteNo;
    data['CanOpen'] = this.canOpen;
    data['ShowMenu'] = this.showMenu;
    data['CanCreateSubFolder'] = this.canCreateSubFolder;
    data['CanRename'] = this.canRename;
    data['CanShare'] = this.canShare;
    data['CanMove'] = this.canMove;
    data['CanCopy'] = this.canCopy;
    data['CanArchive'] = this.canArchive;
    data['CanDelete'] = this.canDelete;
    data['CanSeeDetail'] = this.canSeeDetail;
    data['CanManagePermission'] = this.canManagePermission;
    data['CreatedBy'] = this.createdBy;
    data['LastUpdatedDate'] = this.lastUpdatedDate;
    data['LastUpdatedBy'] = this.lastUpdatedBy;
    data['IsDeleted'] = this.isDeleted;
    data['SequenceOrder'] = this.sequenceOrder;
    data['CompanyId'] = this.companyId;
    data['DataAction'] = this.dataAction;
    data['Status'] = this.status;
    data['VersionNo'] = this.versionNo;
    return data;
  }
}
