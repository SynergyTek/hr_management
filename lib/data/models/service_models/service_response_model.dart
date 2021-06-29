class ServiceResponseModel {
  String json;
  String templateCode;
  String templateDisplayName;
  List<ColumnList> columnList;
  String udfTableMetadataId;
  String serviceNo;
  String serviceSubject;
  String serviceDescription;
  String startDate;
  String dueDate;
  String serviceSLA;
  double serviceSLAMinutes;
  String actualSLA;
  String serviceStatusBgCss;
  String serviceStatusFontCss;
  String serviceStatusId;
  String serviceStatusCode;
  String serviceStatusName;
  String serviceActionId;
  String serviceActionCode;
  String serviceActionName;
  String servicePriorityId;
  String servicePriorityCode;
  String servicePriorityName;
  String requestedByUserId;
  String requestedByUserName;
  String requestedByUserEmail;
  String requestedByUserPhotoId;
  String ownerUserId;
  String ownerUserName;
  String ownerUserEmail;
  String ownerUserPhotoId;
  int activeUserType;
  bool isStepTaskAutoCompleteIfSameAssignee;
  bool includeReadonlyData;
  String activeUserId;
  String serviceId;
  bool isDraftButtonVisible;
  bool isSubmitButtonVisible;
  bool isInEditMode;
  bool isVersioningButtonVisible;
  bool isCancelButtonVisible;
  bool isReplyButtonVisible;
  bool isCompleteButtonVisible;
  bool isRejectButtonVisible;
  bool isCloseButtonVisible;
  int sharedCount;
  int attachmentCount;
  int notificationCount;
  int commentCount;
  bool isAddCommentEnabled;
  bool isAddAttachmentEnabled;
  bool isSharingEnabled;
  bool includeSharedList;
  String sharedListText;
  int serviceCount;
  String serviceNoTextWithDefault;
  bool hideStepTaskDetails;
  bool isVersioning;
  bool enableIndexPage;
  bool enableServiceNumberManual;
  bool enableSaveAsDraft;
  bool enableCompleteButton;
  bool enableBackButton;
  bool enableAttachment;
  bool enableComment;
  String templateId;
  String udfTemplateId;
  String serviceIndexPageTemplateId;
  int createReturnType;
  int editReturnType;
  bool allowSLAChange;
  String priorityId;
  String iconFileId;
  String bannerFileId;
  bool enableCancelButton;
  bool isCancelReasonRequired;
  bool hideHeader;
  bool hideSubject;
  bool hideDescription;
  bool hideStartDate;
  bool hideExpiryDate;
  bool hideSLA;
  bool hidePriority;
  bool isSubjectMandatory;
  bool isSubjectUnique;
  bool isDescriptionMandatory;
  bool hideToolbar;
  bool hideBanner;
  bool hideOwner;
  bool allowPastStartDate;
  List<Null> adhocTaskTemplateIds;
  bool enablePrintButton;
  bool enableDataPermission;
  String id;
  String createdDate;
  String createdBy;
  String lastUpdatedDate;
  String lastUpdatedBy;
  bool isDeleted;
  int sequenceOrder;
  String companyId;
  int dataAction;
  int status;
  int versionNo;

  ServiceResponseModel({
    this.json,
    this.templateCode,
    this.templateDisplayName,
    this.columnList,
    this.udfTableMetadataId,
    this.serviceNo,
    this.startDate,
    this.dueDate,
    this.serviceSLA,
    this.serviceSLAMinutes,
    this.actualSLA,
    this.serviceStatusBgCss,
    this.serviceStatusFontCss,
    this.serviceStatusId,
    this.serviceStatusCode,
    this.serviceStatusName,
    this.serviceActionId,
    this.serviceActionCode,
    this.serviceActionName,
    this.servicePriorityId,
    this.servicePriorityCode,
    this.servicePriorityName,
    this.requestedByUserId,
    this.requestedByUserName,
    this.requestedByUserEmail,
    this.requestedByUserPhotoId,
    this.ownerUserId,
    this.ownerUserName,
    this.ownerUserEmail,
    this.ownerUserPhotoId,
    this.activeUserType,
    this.isStepTaskAutoCompleteIfSameAssignee,
    this.includeReadonlyData,
    this.activeUserId,
    this.serviceId,
    this.isDraftButtonVisible,
    this.isSubmitButtonVisible,
    this.isInEditMode,
    this.isVersioningButtonVisible,
    this.isCancelButtonVisible,
    this.isReplyButtonVisible,
    this.isCompleteButtonVisible,
    this.isRejectButtonVisible,
    this.isCloseButtonVisible,
    this.sharedCount,
    this.attachmentCount,
    this.notificationCount,
    this.commentCount,
    this.isAddCommentEnabled,
    this.isAddAttachmentEnabled,
    this.isSharingEnabled,
    this.includeSharedList,
    this.sharedListText,
    this.serviceCount,
    this.serviceNoTextWithDefault,
    this.hideStepTaskDetails,
    this.isVersioning,
    this.enableIndexPage,
    this.enableServiceNumberManual,
    this.enableSaveAsDraft,
    this.enableCompleteButton,
    this.enableBackButton,
    this.enableAttachment,
    this.enableComment,
    this.templateId,
    this.udfTemplateId,
    this.serviceIndexPageTemplateId,
    this.createReturnType,
    this.editReturnType,
    this.allowSLAChange,
    this.priorityId,
    this.iconFileId,
    this.bannerFileId,
    this.enableCancelButton,
    this.isCancelReasonRequired,
    this.hideHeader,
    this.hideSubject,
    this.hideDescription,
    this.hideStartDate,
    this.hideExpiryDate,
    this.hideSLA,
    this.hidePriority,
    this.isSubjectMandatory,
    this.isSubjectUnique,
    this.isDescriptionMandatory,
    this.hideToolbar,
    this.hideBanner,
    this.hideOwner,
    this.allowPastStartDate,
    this.adhocTaskTemplateIds,
    this.enablePrintButton,
    this.enableDataPermission,
    this.id,
    this.createdDate,
    this.createdBy,
    this.lastUpdatedDate,
    this.lastUpdatedBy,
    this.isDeleted,
    this.sequenceOrder,
    this.companyId,
    this.dataAction,
    this.status,
    this.versionNo,
  });

  ServiceResponseModel.fromJson(Map<String, dynamic> jsonResponse) {
    json = jsonResponse['Json'];
    templateCode = jsonResponse['TemplateCode'];
    templateDisplayName = jsonResponse['TemplateDisplayName'];
    if (jsonResponse['ColumnList'] != null) {
      columnList = new List<ColumnList>();
      jsonResponse['ColumnList'].forEach((v) {
        columnList.add(new ColumnList.fromJson(v));
      });
    }
    udfTableMetadataId = jsonResponse['UdfTableMetadataId'];
    serviceNo = jsonResponse['ServiceNo'];
    serviceSubject = jsonResponse['ServiceSubject'];
    serviceDescription = jsonResponse['ServiceDescription'];
    startDate = jsonResponse['StartDate'];
    dueDate = jsonResponse['DueDate'];
    serviceSLA = jsonResponse['ServiceSLA'];
    serviceSLAMinutes = jsonResponse['ServiceSLAMinutes'];
    actualSLA = jsonResponse['ActualSLA'];
    serviceStatusBgCss = jsonResponse['ServiceStatusBgCss'];
    serviceStatusFontCss = jsonResponse['ServiceStatusFontCss'];
    serviceStatusId = jsonResponse['ServiceStatusId'];
    serviceStatusCode = jsonResponse['ServiceStatusCode'];
    serviceStatusName = jsonResponse['ServiceStatusName'];
    serviceActionId = jsonResponse['ServiceActionId'];
    serviceActionCode = jsonResponse['ServiceActionCode'];
    serviceActionName = jsonResponse['ServiceActionName'];
    servicePriorityId = jsonResponse['ServicePriorityId'];
    servicePriorityCode = jsonResponse['ServicePriorityCode'];
    servicePriorityName = jsonResponse['ServicePriorityName'];
    requestedByUserId = jsonResponse['RequestedByUserId'];
    requestedByUserName = jsonResponse['RequestedByUserName'];
    requestedByUserEmail = jsonResponse['RequestedByUserEmail'];
    requestedByUserPhotoId = jsonResponse['RequestedByUserPhotoId'];
    ownerUserId = jsonResponse['OwnerUserId'];
    ownerUserName = jsonResponse['OwnerUserName'];
    ownerUserEmail = jsonResponse['OwnerUserEmail'];
    ownerUserPhotoId = jsonResponse['OwnerUserPhotoId'];
    activeUserType = jsonResponse['ActiveUserType'];
    isStepTaskAutoCompleteIfSameAssignee =
        jsonResponse['IsStepTaskAutoCompleteIfSameAssignee'];
    includeReadonlyData = jsonResponse['IncludeReadonlyData'];
    activeUserId = jsonResponse['ActiveUserId'];
    serviceId = jsonResponse['ServiceId'];
    isDraftButtonVisible = jsonResponse['IsDraftButtonVisible'];
    isSubmitButtonVisible = jsonResponse['IsSubmitButtonVisible'];
    isInEditMode = jsonResponse['IsInEditMode'];
    isVersioningButtonVisible = jsonResponse['IsVersioningButtonVisible'];
    isCancelButtonVisible = jsonResponse['IsCancelButtonVisible'];
    isReplyButtonVisible = jsonResponse['IsReplyButtonVisible'];
    isCompleteButtonVisible = jsonResponse['IsCompleteButtonVisible'];
    isRejectButtonVisible = jsonResponse['IsRejectButtonVisible'];
    isCloseButtonVisible = jsonResponse['IsCloseButtonVisible'];
    sharedCount = jsonResponse['SharedCount'];
    attachmentCount = jsonResponse['AttachmentCount'];
    notificationCount = jsonResponse['NotificationCount'];
    commentCount = jsonResponse['CommentCount'];
    isAddCommentEnabled = jsonResponse['IsAddCommentEnabled'];
    isAddAttachmentEnabled = jsonResponse['IsAddAttachmentEnabled'];
    isSharingEnabled = jsonResponse['IsSharingEnabled'];
    includeSharedList = jsonResponse['IncludeSharedList'];
    sharedListText = jsonResponse['SharedListText'];
    serviceCount = jsonResponse['ServiceCount'];
    serviceNoTextWithDefault = jsonResponse['ServiceNoTextWithDefault'];
    hideStepTaskDetails = jsonResponse['HideStepTaskDetails'];
    isVersioning = jsonResponse['IsVersioning'];
    enableIndexPage = jsonResponse['EnableIndexPage'];
    enableServiceNumberManual = jsonResponse['EnableServiceNumberManual'];
    enableSaveAsDraft = jsonResponse['EnableSaveAsDraft'];
    enableCompleteButton = jsonResponse['EnableCompleteButton'];
    enableBackButton = jsonResponse['EnableBackButton'];
    enableAttachment = jsonResponse['EnableAttachment'];
    enableComment = jsonResponse['EnableComment'];
    templateId = jsonResponse['TemplateId'];
    udfTemplateId = jsonResponse['UdfTemplateId'];
    serviceIndexPageTemplateId = jsonResponse['ServiceIndexPageTemplateId'];
    createReturnType = jsonResponse['CreateReturnType'];
    editReturnType = jsonResponse['EditReturnType'];
    allowSLAChange = jsonResponse['AllowSLAChange'];
    priorityId = jsonResponse['PriorityId'];
    iconFileId = jsonResponse['IconFileId'];
    bannerFileId = jsonResponse['BannerFileId'];
    enableCancelButton = jsonResponse['EnableCancelButton'];
    isCancelReasonRequired = jsonResponse['IsCancelReasonRequired'];
    hideHeader = jsonResponse['HideHeader'];
    hideSubject = jsonResponse['HideSubject'];
    hideDescription = jsonResponse['HideDescription'];
    hideStartDate = jsonResponse['HideStartDate'];
    hideExpiryDate = jsonResponse['HideExpiryDate'];
    hideSLA = jsonResponse['HideSLA'];
    hidePriority = jsonResponse['HidePriority'];
    isSubjectMandatory = jsonResponse['IsSubjectMandatory'];
    isSubjectUnique = jsonResponse['IsSubjectUnique'];
    isDescriptionMandatory = jsonResponse['IsDescriptionMandatory'];
    hideToolbar = jsonResponse['HideToolbar'];
    hideBanner = jsonResponse['HideBanner'];
    hideOwner = jsonResponse['HideOwner'];
    allowPastStartDate = jsonResponse['AllowPastStartDate'];
    if (jsonResponse['AdhocTaskTemplateIds'] != null) {
      adhocTaskTemplateIds = [];
      jsonResponse['AdhocTaskTemplateIds'].forEach((v) {
        adhocTaskTemplateIds.add(v);
        // adhocTaskTemplateIds.add(new Null.fromJson(v));
      });
    }
    enablePrintButton = jsonResponse['EnablePrintButton'];
    enableDataPermission = jsonResponse['EnableDataPermission'];
    id = jsonResponse['Id'];
    createdDate = jsonResponse['CreatedDate'];
    createdBy = jsonResponse['CreatedBy'];
    lastUpdatedDate = jsonResponse['LastUpdatedDate'];
    lastUpdatedBy = jsonResponse['LastUpdatedBy'];
    isDeleted = jsonResponse['IsDeleted'];
    sequenceOrder = jsonResponse['SequenceOrder'];
    companyId = jsonResponse['CompanyId'];
    dataAction = jsonResponse['DataAction'];
    status = jsonResponse['Status'];
    versionNo = jsonResponse['VersionNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Json'] = this.json;
    data['TemplateCode'] = this.templateCode;
    data['TemplateDisplayName'] = this.templateDisplayName;
    if (this.columnList != null) {
      data['ColumnList'] = this.columnList.map((v) => v.toJson()).toList();
    }
    data['UdfTableMetadataId'] = this.udfTableMetadataId;
    data['ServiceNo'] = this.serviceNo;
    data['ServiceSubject'] = this.serviceSubject;
    data['ServiceDescription'] = this.serviceDescription;
    data['StartDate'] = this.startDate;
    data['DueDate'] = this.dueDate;
    data['ServiceSLA'] = this.serviceSLA;
    data['ServiceSLAMinutes'] = this.serviceSLAMinutes;
    data['ActualSLA'] = this.actualSLA;
    data['ServiceStatusBgCss'] = this.serviceStatusBgCss;
    data['ServiceStatusFontCss'] = this.serviceStatusFontCss;
    data['ServiceStatusId'] = this.serviceStatusId;
    data['ServiceStatusCode'] = this.serviceStatusCode;
    data['ServiceStatusName'] = this.serviceStatusName;
    data['ServiceActionId'] = this.serviceActionId;
    data['ServiceActionCode'] = this.serviceActionCode;
    data['ServiceActionName'] = this.serviceActionName;
    data['ServicePriorityId'] = this.servicePriorityId;
    data['ServicePriorityCode'] = this.servicePriorityCode;
    data['ServicePriorityName'] = this.servicePriorityName;
    data['RequestedByUserId'] = this.requestedByUserId;
    data['RequestedByUserName'] = this.requestedByUserName;
    data['RequestedByUserEmail'] = this.requestedByUserEmail;
    data['RequestedByUserPhotoId'] = this.requestedByUserPhotoId;
    data['OwnerUserId'] = this.ownerUserId;
    data['OwnerUserName'] = this.ownerUserName;
    data['OwnerUserEmail'] = this.ownerUserEmail;
    data['OwnerUserPhotoId'] = this.ownerUserPhotoId;
    data['ActiveUserType'] = this.activeUserType;
    data['IsStepTaskAutoCompleteIfSameAssignee'] =
        this.isStepTaskAutoCompleteIfSameAssignee;
    data['IncludeReadonlyData'] = this.includeReadonlyData;
    data['ActiveUserId'] = this.activeUserId;
    data['ServiceId'] = this.serviceId;
    data['IsDraftButtonVisible'] = this.isDraftButtonVisible;
    data['IsSubmitButtonVisible'] = this.isSubmitButtonVisible;
    data['IsInEditMode'] = this.isInEditMode;
    data['IsVersioningButtonVisible'] = this.isVersioningButtonVisible;
    data['IsCancelButtonVisible'] = this.isCancelButtonVisible;
    data['IsReplyButtonVisible'] = this.isReplyButtonVisible;
    data['IsCompleteButtonVisible'] = this.isCompleteButtonVisible;
    data['IsRejectButtonVisible'] = this.isRejectButtonVisible;
    data['IsCloseButtonVisible'] = this.isCloseButtonVisible;
    data['SharedCount'] = this.sharedCount;
    data['AttachmentCount'] = this.attachmentCount;
    data['NotificationCount'] = this.notificationCount;
    data['CommentCount'] = this.commentCount;
    data['IsAddCommentEnabled'] = this.isAddCommentEnabled;
    data['IsAddAttachmentEnabled'] = this.isAddAttachmentEnabled;
    data['IsSharingEnabled'] = this.isSharingEnabled;
    data['IncludeSharedList'] = this.includeSharedList;
    data['SharedListText'] = this.sharedListText;
    data['ServiceCount'] = this.serviceCount;
    data['ServiceNoTextWithDefault'] = this.serviceNoTextWithDefault;
    data['HideStepTaskDetails'] = this.hideStepTaskDetails;
    data['IsVersioning'] = this.isVersioning;
    data['EnableIndexPage'] = this.enableIndexPage;
    data['EnableServiceNumberManual'] = this.enableServiceNumberManual;
    data['EnableSaveAsDraft'] = this.enableSaveAsDraft;
    data['EnableCompleteButton'] = this.enableCompleteButton;
    data['EnableBackButton'] = this.enableBackButton;
    data['EnableAttachment'] = this.enableAttachment;
    data['EnableComment'] = this.enableComment;
    data['TemplateId'] = this.templateId;
    data['UdfTemplateId'] = this.udfTemplateId;
    data['ServiceIndexPageTemplateId'] = this.serviceIndexPageTemplateId;
    data['CreateReturnType'] = this.createReturnType;
    data['EditReturnType'] = this.editReturnType;
    data['AllowSLAChange'] = this.allowSLAChange;
    data['PriorityId'] = this.priorityId;
    data['IconFileId'] = this.iconFileId;
    data['BannerFileId'] = this.bannerFileId;
    data['EnableCancelButton'] = this.enableCancelButton;
    data['IsCancelReasonRequired'] = this.isCancelReasonRequired;
    data['HideHeader'] = this.hideHeader;
    data['HideSubject'] = this.hideSubject;
    data['HideDescription'] = this.hideDescription;
    data['HideStartDate'] = this.hideStartDate;
    data['HideExpiryDate'] = this.hideExpiryDate;
    data['HideSLA'] = this.hideSLA;
    data['HidePriority'] = this.hidePriority;
    data['IsSubjectMandatory'] = this.isSubjectMandatory;
    data['IsSubjectUnique'] = this.isSubjectUnique;
    data['IsDescriptionMandatory'] = this.isDescriptionMandatory;
    data['HideToolbar'] = this.hideToolbar;
    data['HideBanner'] = this.hideBanner;
    data['HideOwner'] = this.hideOwner;
    data['AllowPastStartDate'] = this.allowPastStartDate;
    if (this.adhocTaskTemplateIds != null) {
      data['AdhocTaskTemplateIds'] =
          this.adhocTaskTemplateIds.map((v) => v).toList();
      // this.adhocTaskTemplateIds.map((v) => v.toJson()).toList();
    }
    data['EnablePrintButton'] = this.enablePrintButton;
    data['EnableDataPermission'] = this.enableDataPermission;
    data['Id'] = this.id;
    data['CreatedDate'] = this.createdDate;
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

class ColumnList {
  bool isForeignKeyTableColumn;
  bool isVisible;
  bool isEditable;
  int activeUserType;
  String ntsStatusCode;
  bool isChecked;
  bool ignorePermission;
  String name;
  bool isDefaultDisplayColumn;
  String labelName;
  String alias;
  bool isNullable;
  int dataType;
  int udfUIType;
  bool isForeignKey;
  bool isVirtualColumn;
  bool isVirtualForeignKey;
  bool isPrimaryKey;
  bool isSystemColumn;
  bool isUniqueColumn;
  bool isLogColumn;
  bool isUdfColumn;
  bool isHiddenColumn;
  bool hideForeignKeyTableColumns;
  bool isReferenceColumn;
  int foreignKeyDisplayColumnDataType;
  String tableMetadataId;
  List<String> editableBy;
  List<String> viewableBy;
  List<String> editableContext;
  List<String> viewableContext;
  bool showInForeignKeyReference;
  String id;
  String createdDate;
  String createdBy;
  String lastUpdatedDate;
  String lastUpdatedBy;
  bool isDeleted;
  String companyId;
  int dataAction;
  int status;
  int versionNo;
  String foreignKeyTableId;
  String foreignKeyTableName;
  String foreignKeyColumnId;
  String foreignKeyColumnName;
  String foreignKeyDisplayColumnId;
  String foreignKeyDisplayColumnName;
  String foreignKeyTableAliasName;
  String foreignKeyTableSchemaName;
  String foreignKeyDisplayColumnLabelName;
  String foreignKeyDisplayColumnAlias;
  String foreignKeyConstraintName;
  String value;

  ColumnList(
      {this.isForeignKeyTableColumn,
      this.isVisible,
      this.isEditable,
      this.activeUserType,
      this.ntsStatusCode,
      this.isChecked,
      this.ignorePermission,
      this.name,
      this.isDefaultDisplayColumn,
      this.labelName,
      this.alias,
      this.isNullable,
      this.dataType,
      this.udfUIType,
      this.isForeignKey,
      this.isVirtualColumn,
      this.isVirtualForeignKey,
      this.isPrimaryKey,
      this.isSystemColumn,
      this.isUniqueColumn,
      this.isLogColumn,
      this.isUdfColumn,
      this.isHiddenColumn,
      this.hideForeignKeyTableColumns,
      this.isReferenceColumn,
      this.foreignKeyDisplayColumnDataType,
      this.tableMetadataId,
      this.editableBy,
      this.viewableBy,
      this.editableContext,
      this.viewableContext,
      this.showInForeignKeyReference,
      this.id,
      this.createdDate,
      this.createdBy,
      this.lastUpdatedDate,
      this.lastUpdatedBy,
      this.isDeleted,
      this.companyId,
      this.dataAction,
      this.status,
      this.versionNo,
      this.foreignKeyTableId,
      this.foreignKeyTableName,
      this.foreignKeyColumnId,
      this.foreignKeyColumnName,
      this.foreignKeyDisplayColumnId,
      this.foreignKeyDisplayColumnName,
      this.foreignKeyTableAliasName,
      this.foreignKeyTableSchemaName,
      this.foreignKeyDisplayColumnLabelName,
      this.foreignKeyDisplayColumnAlias,
      this.foreignKeyConstraintName,
      this.value});

  ColumnList.fromJson(Map<String, dynamic> json) {
    isForeignKeyTableColumn = json['IsForeignKeyTableColumn'];
    isVisible = json['IsVisible'];
    isEditable = json['IsEditable'];
    activeUserType = json['ActiveUserType'];
    ntsStatusCode = json['NtsStatusCode'];
    isChecked = json['IsChecked'];
    ignorePermission = json['IgnorePermission'];
    name = json['Name'];
    isDefaultDisplayColumn = json['IsDefaultDisplayColumn'];
    labelName = json['LabelName'];
    alias = json['Alias'];
    isNullable = json['IsNullable'];
    dataType = json['DataType'];
    udfUIType = json['UdfUIType'];
    isForeignKey = json['IsForeignKey'];
    isVirtualColumn = json['IsVirtualColumn'];
    isVirtualForeignKey = json['IsVirtualForeignKey'];
    isPrimaryKey = json['IsPrimaryKey'];
    isSystemColumn = json['IsSystemColumn'];
    isUniqueColumn = json['IsUniqueColumn'];
    isLogColumn = json['IsLogColumn'];
    isUdfColumn = json['IsUdfColumn'];
    isHiddenColumn = json['IsHiddenColumn'];
    hideForeignKeyTableColumns = json['HideForeignKeyTableColumns'];
    isReferenceColumn = json['IsReferenceColumn'];
    foreignKeyDisplayColumnDataType = json['ForeignKeyDisplayColumnDataType'];
    tableMetadataId = json['TableMetadataId'];
    editableBy = json['EditableBy'].cast<String>();
    viewableBy = json['ViewableBy'].cast<String>();
    editableContext = json['EditableContext'].cast<String>();
    viewableContext = json['ViewableContext'].cast<String>();
    showInForeignKeyReference = json['ShowInForeignKeyReference'];
    id = json['Id'];
    createdDate = json['CreatedDate'];
    createdBy = json['CreatedBy'];
    lastUpdatedDate = json['LastUpdatedDate'];
    lastUpdatedBy = json['LastUpdatedBy'];
    isDeleted = json['IsDeleted'];
    companyId = json['CompanyId'];
    dataAction = json['DataAction'];
    status = json['Status'];
    versionNo = json['VersionNo'];
    foreignKeyTableId = json['ForeignKeyTableId'];
    foreignKeyTableName = json['ForeignKeyTableName'];
    foreignKeyColumnId = json['ForeignKeyColumnId'];
    foreignKeyColumnName = json['ForeignKeyColumnName'];
    foreignKeyDisplayColumnId = json['ForeignKeyDisplayColumnId'];
    foreignKeyDisplayColumnName = json['ForeignKeyDisplayColumnName'];
    foreignKeyTableAliasName = json['ForeignKeyTableAliasName'];
    foreignKeyTableSchemaName = json['ForeignKeyTableSchemaName'];
    foreignKeyDisplayColumnLabelName = json['ForeignKeyDisplayColumnLabelName'];
    foreignKeyDisplayColumnAlias = json['ForeignKeyDisplayColumnAlias'];
    foreignKeyConstraintName = json['ForeignKeyConstraintName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsForeignKeyTableColumn'] = this.isForeignKeyTableColumn;
    data['IsVisible'] = this.isVisible;
    data['IsEditable'] = this.isEditable;
    data['ActiveUserType'] = this.activeUserType;
    data['NtsStatusCode'] = this.ntsStatusCode;
    data['IsChecked'] = this.isChecked;
    data['IgnorePermission'] = this.ignorePermission;
    data['Name'] = this.name;
    data['IsDefaultDisplayColumn'] = this.isDefaultDisplayColumn;
    data['LabelName'] = this.labelName;
    data['Alias'] = this.alias;
    data['IsNullable'] = this.isNullable;
    data['DataType'] = this.dataType;
    data['UdfUIType'] = this.udfUIType;
    data['IsForeignKey'] = this.isForeignKey;
    data['IsVirtualColumn'] = this.isVirtualColumn;
    data['IsVirtualForeignKey'] = this.isVirtualForeignKey;
    data['IsPrimaryKey'] = this.isPrimaryKey;
    data['IsSystemColumn'] = this.isSystemColumn;
    data['IsUniqueColumn'] = this.isUniqueColumn;
    data['IsLogColumn'] = this.isLogColumn;
    data['IsUdfColumn'] = this.isUdfColumn;
    data['IsHiddenColumn'] = this.isHiddenColumn;
    data['HideForeignKeyTableColumns'] = this.hideForeignKeyTableColumns;
    data['IsReferenceColumn'] = this.isReferenceColumn;
    data['ForeignKeyDisplayColumnDataType'] =
        this.foreignKeyDisplayColumnDataType;
    data['TableMetadataId'] = this.tableMetadataId;
    data['EditableBy'] = this.editableBy;
    data['ViewableBy'] = this.viewableBy;
    data['EditableContext'] = this.editableContext;
    data['ViewableContext'] = this.viewableContext;
    data['ShowInForeignKeyReference'] = this.showInForeignKeyReference;
    data['Id'] = this.id;
    data['CreatedDate'] = this.createdDate;
    data['CreatedBy'] = this.createdBy;
    data['LastUpdatedDate'] = this.lastUpdatedDate;
    data['LastUpdatedBy'] = this.lastUpdatedBy;
    data['IsDeleted'] = this.isDeleted;
    data['CompanyId'] = this.companyId;
    data['DataAction'] = this.dataAction;
    data['Status'] = this.status;
    data['VersionNo'] = this.versionNo;
    data['ForeignKeyTableId'] = this.foreignKeyTableId;
    data['ForeignKeyTableName'] = this.foreignKeyTableName;
    data['ForeignKeyColumnId'] = this.foreignKeyColumnId;
    data['ForeignKeyColumnName'] = this.foreignKeyColumnName;
    data['ForeignKeyDisplayColumnId'] = this.foreignKeyDisplayColumnId;
    data['ForeignKeyDisplayColumnName'] = this.foreignKeyDisplayColumnName;
    data['ForeignKeyTableAliasName'] = this.foreignKeyTableAliasName;
    data['ForeignKeyTableSchemaName'] = this.foreignKeyTableSchemaName;
    data['ForeignKeyDisplayColumnLabelName'] =
        this.foreignKeyDisplayColumnLabelName;
    data['ForeignKeyDisplayColumnAlias'] = this.foreignKeyDisplayColumnAlias;
    data['ForeignKeyConstraintName'] = this.foreignKeyConstraintName;
    return data;
  }
}
