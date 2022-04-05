class PortalViewModel {
  int? dataAction;
  String? landingPage;
  String? themeData;
  String? portalStatusData;
  String? name;
  int? theme;
  String? domainName;
  String? parentId;
  String? displayName;
  String? title;
  int? portalStatus;
  String? logoId;
  String? bannerId;
  int? bannerHeight;
  String? favIconId;
  String? primaryColor;
  String? secondaryColor;
  String? topBannerBackColor;
  String? topBannerForeColor;
  String? leftMenuBackColor;
  String? leftMenuForeColor;
  bool? enableBreadcrumb;
  bool? enableMultiLanguage;
  String? portalFooterTeext;
  bool? enableLegalEntity;
  bool? enableAccordianMenu;
  String? userGuideId;
  List<dynamic>? allowedLanguageIds;
  String? layout;
  String? licenseKey;
  String? licensePrivateKey;
  String? id;
  String? createdDate;
  String? createdBy;
  String? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  String? sequenceOrder;
  String? companyId;
  String? legalEntityId;
  int? status;
  int? versionNo;
  String? portalId;

  PortalViewModel(
      {this.dataAction,
      this.landingPage,
      this.themeData,
      this.portalStatusData,
      this.name,
      this.theme,
      this.domainName,
      this.parentId,
      this.displayName,
      this.title,
      this.portalStatus,
      this.logoId,
      this.bannerId,
      this.bannerHeight,
      this.favIconId,
      this.primaryColor,
      this.secondaryColor,
      this.topBannerBackColor,
      this.topBannerForeColor,
      this.leftMenuBackColor,
      this.leftMenuForeColor,
      this.enableBreadcrumb,
      this.enableMultiLanguage,
      this.portalFooterTeext,
      this.enableLegalEntity,
      this.enableAccordianMenu,
      this.userGuideId,
      this.allowedLanguageIds,
      this.layout,
      this.licenseKey,
      this.licensePrivateKey,
      this.id,
      this.createdDate,
      this.createdBy,
      this.lastUpdatedDate,
      this.lastUpdatedBy,
      this.isDeleted,
      this.sequenceOrder,
      this.companyId,
      this.legalEntityId,
      this.status,
      this.versionNo,
      this.portalId});

  PortalViewModel.fromJson(Map<String, dynamic> json) {
    dataAction = json['DataAction'];
    landingPage = json['LandingPage'];
    themeData = json['ThemeData'];
    portalStatusData = json['PortalStatusData'];
    name = json['Name'];
    theme = json['Theme'];
    domainName = json['DomainName'];
    parentId = json['ParentId'];
    displayName = json['DisplayName'];
    title = json['Title'];
    portalStatus = json['PortalStatus'];
    logoId = json['LogoId'];
    bannerId = json['BannerId'];
    bannerHeight = json['BannerHeight'];
    favIconId = json['FavIconId'];
    primaryColor = json['PrimaryColor'];
    secondaryColor = json['SecondaryColor'];
    topBannerBackColor = json['TopBannerBackColor'];
    topBannerForeColor = json['TopBannerForeColor'];
    leftMenuBackColor = json['LeftMenuBackColor'];
    leftMenuForeColor = json['LeftMenuForeColor'];
    enableBreadcrumb = json['EnableBreadcrumb'];
    enableMultiLanguage = json['EnableMultiLanguage'];
    portalFooterTeext = json['PortalFooterTeext'];
    enableLegalEntity = json['EnableLegalEntity'];
    enableAccordianMenu = json['EnableAccordianMenu'];
    userGuideId = json['UserGuideId'];
    allowedLanguageIds = json['AllowedLanguageIds'];
    layout = json['Layout'];
    licenseKey = json['LicenseKey'];
    licensePrivateKey = json['LicensePrivateKey'];
    id = json['Id'];
    createdDate = json['CreatedDate'];
    createdBy = json['CreatedBy'];
    lastUpdatedDate = json['LastUpdatedDate'];
    lastUpdatedBy = json['LastUpdatedBy'];
    isDeleted = json['IsDeleted'];
    sequenceOrder = json['SequenceOrder'];
    companyId = json['CompanyId'];
    legalEntityId = json['LegalEntityId'];
    status = json['Status'];
    versionNo = json['VersionNo'];
    portalId = json['PortalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DataAction'] = this.dataAction;
    data['LandingPage'] = this.landingPage;
    data['ThemeData'] = this.themeData;
    data['PortalStatusData'] = this.portalStatusData;
    data['Name'] = this.name;
    data['Theme'] = this.theme;
    data['DomainName'] = this.domainName;
    data['ParentId'] = this.parentId;
    data['DisplayName'] = this.displayName;
    data['Title'] = this.title;
    data['PortalStatus'] = this.portalStatus;
    data['LogoId'] = this.logoId;
    data['BannerId'] = this.bannerId;
    data['BannerHeight'] = this.bannerHeight;
    data['FavIconId'] = this.favIconId;
    data['PrimaryColor'] = this.primaryColor;
    data['SecondaryColor'] = this.secondaryColor;
    data['TopBannerBackColor'] = this.topBannerBackColor;
    data['TopBannerForeColor'] = this.topBannerForeColor;
    data['LeftMenuBackColor'] = this.leftMenuBackColor;
    data['LeftMenuForeColor'] = this.leftMenuForeColor;
    data['EnableBreadcrumb'] = this.enableBreadcrumb;
    data['EnableMultiLanguage'] = this.enableMultiLanguage;
    data['PortalFooterTeext'] = this.portalFooterTeext;
    data['EnableLegalEntity'] = this.enableLegalEntity;
    data['EnableAccordianMenu'] = this.enableAccordianMenu;
    data['UserGuideId'] = this.userGuideId;
    data['AllowedLanguageIds'] = this.allowedLanguageIds;
    data['Layout'] = this.layout;
    data['LicenseKey'] = this.licenseKey;
    data['LicensePrivateKey'] = this.licensePrivateKey;
    data['Id'] = this.id;
    data['CreatedDate'] = this.createdDate;
    data['CreatedBy'] = this.createdBy;
    data['LastUpdatedDate'] = this.lastUpdatedDate;
    data['LastUpdatedBy'] = this.lastUpdatedBy;
    data['IsDeleted'] = this.isDeleted;
    data['SequenceOrder'] = this.sequenceOrder;
    data['CompanyId'] = this.companyId;
    data['LegalEntityId'] = this.legalEntityId;
    data['Status'] = this.status;
    data['VersionNo'] = this.versionNo;
    data['PortalId'] = this.portalId;
    return data;
  }
}
