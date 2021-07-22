class NTSTemplateTreeListModel {
  String id;
  String name;
  String displayName;
  String parentId;
  bool hasChildren;
  bool expanded;
  String type;
  String portalId;
  String rootId;
  int itemLevel;
  bool checked;
  String url;
  String userRoleId;
  String statusCode;
  String statusCodeStr;
  String templateType;
  String templateTypeText;
  String fieldDataType;
  List<TreeViewModelChildren> treeViewModelChildren;

  NTSTemplateTreeListModel({
    this.id,
    this.name,
    this.displayName,
    this.parentId,
    this.hasChildren,
    this.expanded,
    this.type,
    this.portalId,
    this.rootId,
    this.itemLevel,
    this.checked,
    this.url,
    this.userRoleId,
    this.statusCode,
    this.statusCodeStr,
    this.templateType,
    this.templateTypeText,
    this.fieldDataType,
    this.treeViewModelChildren,
  });

  NTSTemplateTreeListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    displayName = json['DisplayName'];
    parentId = json['ParentId'];
    hasChildren = json['hasChildren'];
    expanded = json['expanded'];
    type = json['Type'];
    portalId = json['PortalId'];
    rootId = json['RootId'];
    itemLevel = json['ItemLevel'];
    checked = json['Checked'];
    url = json['Url'];
    userRoleId = json['UserRoleId'];
    statusCode = json['StatusCode'];
    statusCodeStr = json['StatusCodeStr'];
    templateType = json['TemplateType'];
    templateTypeText = json['TemplateTypeText'];
    fieldDataType = json['FieldDataType'];
    if (json['treeViewModelChildren'] != null) {
      treeViewModelChildren = [];
      json['treeViewModelChildren'].forEach((v) {
        treeViewModelChildren.add(new TreeViewModelChildren.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['DisplayName'] = this.displayName;
    data['ParentId'] = this.parentId;
    data['hasChildren'] = this.hasChildren;
    data['expanded'] = this.expanded;
    data['Type'] = this.type;
    data['PortalId'] = this.portalId;
    data['RootId'] = this.rootId;
    data['ItemLevel'] = this.itemLevel;
    data['Checked'] = this.checked;
    data['Url'] = this.url;
    data['UserRoleId'] = this.userRoleId;
    data['StatusCode'] = this.statusCode;
    data['StatusCodeStr'] = this.statusCodeStr;
    data['TemplateType'] = this.templateType;
    data['TemplateTypeText'] = this.templateTypeText;
    data['FieldDataType'] = this.fieldDataType;
    if (this.treeViewModelChildren != null) {
      data['treeViewModelChildren'] =
          this.treeViewModelChildren.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TreeViewModelChildren {
  String id;
  String name;
  String displayName;
  String parentId;
  bool hasChildren;
  bool expanded;
  String type;
  String portalId;
  String rootId;
  int itemLevel;
  bool checked;
  String url;
  String userRoleId;
  String statusCode;
  String statusCodeStr;
  int templateType;
  String templateTypeText;
  String fieldDataType;
  String treeViewModelChildren;

  TreeViewModelChildren({
    this.id,
    this.name,
    this.displayName,
    this.parentId,
    this.hasChildren,
    this.expanded,
    this.type,
    this.portalId,
    this.rootId,
    this.itemLevel,
    this.checked,
    this.url,
    this.userRoleId,
    this.statusCode,
    this.statusCodeStr,
    this.templateType,
    this.templateTypeText,
    this.fieldDataType,
    this.treeViewModelChildren,
  });

  TreeViewModelChildren.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    displayName = json['DisplayName'];
    parentId = json['ParentId'];
    hasChildren = json['hasChildren'];
    expanded = json['expanded'];
    type = json['Type'];
    portalId = json['PortalId'];
    rootId = json['RootId'];
    itemLevel = json['ItemLevel'];
    checked = json['Checked'];
    url = json['Url'];
    userRoleId = json['UserRoleId'];
    statusCode = json['StatusCode'];
    statusCodeStr = json['StatusCodeStr'];
    templateType = json['TemplateType'];
    templateTypeText = json['TemplateTypeText'];
    fieldDataType = json['FieldDataType'];
    treeViewModelChildren = json['treeViewModelChildren'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['DisplayName'] = this.displayName;
    data['ParentId'] = this.parentId;
    data['hasChildren'] = this.hasChildren;
    data['expanded'] = this.expanded;
    data['Type'] = this.type;
    data['PortalId'] = this.portalId;
    data['RootId'] = this.rootId;
    data['ItemLevel'] = this.itemLevel;
    data['Checked'] = this.checked;
    data['Url'] = this.url;
    data['UserRoleId'] = this.userRoleId;
    data['StatusCode'] = this.statusCode;
    data['StatusCodeStr'] = this.statusCodeStr;
    data['TemplateType'] = this.templateType;
    data['TemplateTypeText'] = this.templateTypeText;
    data['FieldDataType'] = this.fieldDataType;
    data['treeViewModelChildren'] = this.treeViewModelChildren;
    return data;
  }
}
