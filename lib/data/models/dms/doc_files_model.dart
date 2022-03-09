// To parse this JSON data, do
//
//     final DMSFilesModel = DMSFilesModelFromJson(jsonString);

import 'dart:convert';

DMSFilesModel dmsFilesModelFromJson(String str) =>
    DMSFilesModel.fromJson(json.decode(str));

String dmsFilesModelToJson(DMSFilesModel data) => json.encode(data.toJson());

class DMSFilesModel {
  DMSFilesModel({
    this.cwd,
    this.files,
    this.error,
    this.details,
  });

  Cwd? cwd;
  List<Cwd>? files;
  dynamic error;
  dynamic details;

  factory DMSFilesModel.fromJson(Map<String, dynamic> json) => DMSFilesModel(
        cwd: Cwd.fromJson(json["cwd"]),
        files: List<Cwd>.from(json["files"].map((x) => Cwd.fromJson(x))),
        error: json["error"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "cwd": cwd!.toJson(),
        "files": List<dynamic>.from(files!.map((x) => x.toJson())),
        "error": error,
        "details": details,
      };
}

class Cwd {
  Cwd({
    this.data,
    this.showHiddenItems,
    this.searchString,
    this.saseSensitive,
    this.uploadFiles,
    this.renameFiles,
    this.targetPath,
    this.parentId,
    this.filterId,
    this.filterPath,
    this.id,
    this.type,
    this.isFile,
    this.hasChild,
    this.dateCreated,
    this.dateModified,
    this.previousName,
    this.size,
    this.name,
    this.names,
    this.newName,
    this.action,
    this.path,
    this.targetData,
    this.permission,
    this.folderType,
    this.templateCode,
    this.count,
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
    this.canCreateWorkspace,
    this.canEditDocument,
    this.serviceId,
    this.workflowTemplateId,
    this.workflowTemplateCode,
    this.workflowServiceId,
    this.canShareDocument,
    this.modifiedStatus,
    this.documentApprovalStatusType,
    this.statusName,
    this.canDeleteDocument,
    this.workspaceId,
  });

  String? get searchS {
    return createString();
  }

  String? createString() {
    return name;
  }

  dynamic data;
  bool? showHiddenItems;
  dynamic searchString;
  bool? saseSensitive;
  dynamic uploadFiles;
  dynamic renameFiles;
  dynamic targetPath;
  String? parentId;
  dynamic filterId;
  dynamic filterPath;
  String? id;
  dynamic type;
  bool? isFile;
  bool? hasChild;
  DateTime? dateCreated;
  DateTime? dateModified;
  dynamic previousName;
  int? size;
  String? name;
  dynamic names;
  dynamic newName;
  dynamic action;
  dynamic path;
  dynamic targetData;
  dynamic permission;
  int? folderType;
  String? templateCode;
  String? count;
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
  bool? canCreateWorkspace;
  bool? canEditDocument;
  dynamic serviceId;
  dynamic workflowTemplateId;
  dynamic workflowTemplateCode;
  dynamic workflowServiceId;
  bool? canShareDocument;
  dynamic modifiedStatus;
  dynamic documentApprovalStatusType;
  dynamic statusName;
  bool? canDeleteDocument;
  String? workspaceId;

  factory Cwd.fromJson(Map<String, dynamic> json) => Cwd(
        data: json["data"],
        showHiddenItems: json["showHiddenItems"],
        searchString: json["searchString"],
        saseSensitive: json["saseSensitive"],
        uploadFiles: json["uploadFiles"],
        renameFiles: json["renameFiles"],
        targetPath: json["targetPath"],
        parentId: json["parentId"] == null ? null : json["parentId"],
        filterId: json["filterId"],
        filterPath: json["filterPath"],
        id: json["id"],
        type: json["type"],
        isFile: json["isFile"],
        hasChild: json["hasChild"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        dateModified: DateTime.parse(json["dateModified"]),
        previousName: json["previousName"],
        size: json["size"],
        name: json["name"],
        names: json["names"],
        newName: json["newName"],
        action: json["action"],
        path: json["path"],
        targetData: json["targetData"],
        permission: json["permission"],
        folderType: json["FolderType"],
        templateCode:
            json["TemplateCode"] == null ? null : json["TemplateCode"],
        count: json["Count"] == null ? null : json["Count"],
        canOpen: json["CanOpen"],
        showMenu: json["ShowMenu"],
        canCreateSubFolder: json["CanCreateSubFolder"],
        canRename: json["CanRename"],
        canShare: json["CanShare"],
        canMove: json["CanMove"],
        canCopy: json["CanCopy"],
        canArchive: json["CanArchive"],
        canDelete: json["CanDelete"],
        canSeeDetail: json["CanSeeDetail"],
        canManagePermission: json["CanManagePermission"],
        canCreateWorkspace: json["CanCreateWorkspace"],
        canEditDocument: json["CanEditDocument"],
        serviceId: json["ServiceId"],
        workflowTemplateId: json["WorkflowTemplateId"],
        workflowTemplateCode: json["WorkflowTemplateCode"],
        workflowServiceId: json["WorkflowServiceId"],
        canShareDocument: json["CanShareDocument"],
        modifiedStatus: json["ModifiedStatus"],
        documentApprovalStatusType: json["DocumentApprovalStatusType"],
        statusName: json["StatusName"],
        canDeleteDocument: json["CanDeleteDocument"],
        workspaceId: json["WorkspaceId"] == null ? null : json["WorkspaceId"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "showHiddenItems": showHiddenItems,
        "searchString": searchString,
        "saseSensitive": saseSensitive,
        "uploadFiles": uploadFiles,
        "renameFiles": renameFiles,
        "targetPath": targetPath,
        "parentId": parentId == null ? null : parentId,
        "filterId": filterId,
        "filterPath": filterPath,
        "id": id,
        "type": type,
        "isFile": isFile,
        "hasChild": hasChild,
        "dateCreated": dateCreated!.toIso8601String(),
        "dateModified": dateModified!.toIso8601String(),
        "previousName": previousName,
        "size": size,
        "name": name,
        "names": names,
        "newName": newName,
        "action": action,
        "path": path,
        "targetData": targetData,
        "permission": permission,
        "FolderType": folderType,
        "TemplateCode": templateCode == null ? null : templateCode,
        "Count": count == null ? null : count,
        "CanOpen": canOpen,
        "ShowMenu": showMenu,
        "CanCreateSubFolder": canCreateSubFolder,
        "CanRename": canRename,
        "CanShare": canShare,
        "CanMove": canMove,
        "CanCopy": canCopy,
        "CanArchive": canArchive,
        "CanDelete": canDelete,
        "CanSeeDetail": canSeeDetail,
        "CanManagePermission": canManagePermission,
        "CanCreateWorkspace": canCreateWorkspace,
        "CanEditDocument": canEditDocument,
        "ServiceId": serviceId,
        "WorkflowTemplateId": workflowTemplateId,
        "WorkflowTemplateCode": workflowTemplateCode,
        "WorkflowServiceId": workflowServiceId,
        "CanShareDocument": canShareDocument,
        "ModifiedStatus": modifiedStatus,
        "DocumentApprovalStatusType": documentApprovalStatusType,
        "StatusName": statusName,
        "CanDeleteDocument": canDeleteDocument,
        "WorkspaceId": workspaceId == null ? null : workspaceId,
      };
}
