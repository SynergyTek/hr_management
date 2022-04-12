// To parse this JSON data, do
//
//     final sourceFolderModel = sourceFolderModelFromJson(jsonString);

import 'dart:convert';

List<DMSSourceFolderModel> sourceFolderModelFromJson(String str) =>
    List<DMSSourceFolderModel>.from(
        json.decode(str).map((x) => DMSSourceFolderModel.fromJson(x)));

String dmsSourceFolderModelToJson(List<DMSSourceFolderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DMSSourceFolderModel {
  DMSSourceFolderModel({
    this.title,
    this.key,
    this.lazy,
    this.expanded,
    this.active,
    this.folder,
    this.workspace,
    this.document,
    this.file,
    this.fileId,
    this.fileSize,
    this.count,
    this.sequence,
    this.noteNo,
    this.workflowServiceStatusName,
    this.createdBy,
    this.createdDate,
    this.updatedDate,
    this.canCreateWorkspace,
    this.canManagePermission,
    this.canSeeDetail,
    this.canDelete,
    this.canArchive,
    this.canCopy,
    this.canMove,
    this.canShare,
    this.canRename,
    this.canCreateSubFolder,
    this.showMenu,
    this.canOpen,
    this.templateCode,
    this.sourceFolderModelParentId,
    this.parentId,
    this.workspaceId,
    this.folderType,
    this.workflowTemplateCode,
    this.documentApprovalStatusType,
    this.workflowServiceId,
    this.statusName,
    this.canEditDocument,
    this.canCreateDocument,
    this.workflowServiceStatus,
    this.type,
    this.namespaces,
    this.methodName,
    this.templateType,
    this.checkbox,
    this.fieldDataType,
    this.itemType,
    this.parentName,
    this.isSelfWorkspace,
    this.children,
    this.nodeId,
  });

  String? title;
  String? key;
  bool? lazy;
  bool? expanded;
  bool? active;
  bool? folder;
  bool? workspace;
  bool? document;
  bool? file;
  String? fileId;
  String? fileSize;
  String? count;
  int? sequence;
  String? noteNo;
  String? workflowServiceStatusName;
  String? createdBy;
  DateTime? createdDate;
  DateTime? updatedDate;
  bool? canCreateWorkspace;
  bool? canManagePermission;
  bool? canSeeDetail;
  bool? canDelete;
  bool? canArchive;
  bool? canCopy;
  bool? canMove;
  bool? canShare;
  bool? canRename;
  bool? canCreateSubFolder;
  bool? showMenu;
  bool? canOpen;
  String? templateCode;
  String? sourceFolderModelParentId;
  String? parentId;
  String? workspaceId;
  int? folderType;
  String? workflowTemplateCode;
  String? documentApprovalStatusType;
  String? workflowServiceId;
  String? statusName;
  bool? canEditDocument;
  bool? canCreateDocument;
  String? workflowServiceStatus;
  String? type;
  String? namespaces;
  String? methodName;
  String? templateType;
  String? checkbox;
  String? fieldDataType;
  String? itemType;
  String? parentName;
  bool? isSelfWorkspace;
  String? children;
  String? nodeId;

  factory DMSSourceFolderModel.fromJson(Map<String, dynamic> json) =>
      DMSSourceFolderModel(
        title: json["title"],
        key: json["key"],
        lazy: json["lazy"],
        expanded: json["expanded"],
        active: json["active"],
        folder: json["folder"],
        workspace: json["Workspace"],
        document: json["Document"],
        file: json["File"],
        fileId: json["FileId"],
        fileSize: json["FileSize"],
        count: json["Count"],
        sequence: json["Sequence"],
        noteNo: json["NoteNo"],
        workflowServiceStatusName: json["WorkflowServiceStatusName"],
        createdBy: json["CreatedBy"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        updatedDate: DateTime.parse(json["UpdatedDate"]),
        canCreateWorkspace: json["CanCreateWorkspace"],
        canManagePermission: json["CanManagePermission"],
        canSeeDetail: json["CanSeeDetail"],
        canDelete: json["CanDelete"],
        canArchive: json["CanArchive"],
        canCopy: json["CanCopy"],
        canMove: json["CanMove"],
        canShare: json["CanShare"],
        canRename: json["CanRename"],
        canCreateSubFolder: json["CanCreateSubFolder"],
        showMenu: json["ShowMenu"],
        canOpen: json["CanOpen"],
        templateCode: json["TemplateCode"],
        sourceFolderModelParentId: json["parentId"],
        parentId: json["ParentId"],
        workspaceId: json["WorkspaceId"],
        folderType: json["FolderType"],
        workflowTemplateCode: json["WorkflowTemplateCode"],
        documentApprovalStatusType: json["DocumentApprovalStatusType"],
        workflowServiceId: json["WorkflowServiceId"],
        statusName: json["StatusName"],
        canEditDocument: json["CanEditDocument"],
        canCreateDocument: json["CanCreateDocument"],
        workflowServiceStatus: json["WorkflowServiceStatus"],
        type: json["type"],
        namespaces: json["namespaces"],
        methodName: json["methodName"],
        templateType: json["templateType"],
        checkbox: json["checkbox"],
        fieldDataType: json["FieldDataType"],
        itemType: json["ItemType"],
        parentName: json["ParentName"],
        isSelfWorkspace: json["IsSelfWorkspace"],
        children: json["children"],
        nodeId: json["NodeId"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "key": key,
        "lazy": lazy,
        "expanded": expanded,
        "active": active,
        "folder": folder,
        "Workspace": workspace,
        "Document": document,
        "File": file,
        "FileId": fileId,
        "FileSize": fileSize,
        "Count": count,
        "Sequence": sequence,
        "NoteNo": noteNo,
        "WorkflowServiceStatusName": workflowServiceStatusName,
        "CreatedBy": createdBy,
        "CreatedDate":
            createdDate != null ? createdDate!.toIso8601String() : null,
        "UpdatedDate":
            updatedDate != null ? updatedDate!.toIso8601String() : null,
        "CanCreateWorkspace": canCreateWorkspace,
        "CanManagePermission": canManagePermission,
        "CanSeeDetail": canSeeDetail,
        "CanDelete": canDelete,
        "CanArchive": canArchive,
        "CanCopy": canCopy,
        "CanMove": canMove,
        "CanShare": canShare,
        "CanRename": canRename,
        "CanCreateSubFolder": canCreateSubFolder,
        "ShowMenu": showMenu,
        "CanOpen": canOpen,
        "TemplateCode": templateCode,
        "parentId": sourceFolderModelParentId,
        "ParentId": parentId,
        "WorkspaceId": workspaceId,
        "FolderType": folderType,
        "WorkflowTemplateCode": workflowTemplateCode,
        "DocumentApprovalStatusType": documentApprovalStatusType,
        "WorkflowServiceId": workflowServiceId,
        "StatusName": statusName,
        "CanEditDocument": canEditDocument,
        "CanCreateDocument": canCreateDocument,
        "WorkflowServiceStatus": workflowServiceStatus,
        "type": type,
        "namespaces": namespaces,
        "methodName": methodName,
        "templateType": templateType,
        "checkbox": checkbox,
        "FieldDataType": fieldDataType,
        "ItemType": itemType,
        "ParentName": parentName,
        "IsSelfWorkspace": isSelfWorkspace,
        "children": children,
        "NodeId": nodeId,
      };
}
