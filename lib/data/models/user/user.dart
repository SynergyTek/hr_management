class User {
  String createdByName;
  String lastUpdatedByName;
  String companyName;
  String companyCode;
  String confirmPassword;
  String userName;
  String lastName;
  String returnUrl;
  String layout;
  String portal;
  String portalName;
  String userType;
  String test;
  String userPortals;
  String legalEntityCode;
  bool sendWelcomeEmail;
  String personId;
  String positionId;
  String departmentId;
  String name;
  String email;
  String jobTitle;
  String password;
  String photoId;
  String mobile;
  String forgotPasswordOTP;
  bool passwordChanged;
  bool isSystemAdmin;
  bool isGuestUser;
  String userRoles;
  String userPermissions;
  String signatureId;
  bool enableRegularEmail;
  bool enableSummaryEmail;
  String lineManagerId;
  String activationCode;
  List<String> legalEntityIds;
  String id;
  String createdDate;
  String createdBy;
  String lastUpdatedDate;
  String lastUpdatedBy;
  bool isDeleted;
  int sequenceOrder;
  String companyId;
  String legalEntityId;
  int dataAction;
  int status;
  int versionNo;
  String portalId;

  User(
      {this.createdByName,
      this.lastUpdatedByName,
      this.companyName,
      this.companyCode,
      this.confirmPassword,
      this.userName,
      this.lastName,
      this.returnUrl,
      this.layout,
      this.portal,
      this.portalName,
      this.userType,
      this.test,
      this.userPortals,
      this.legalEntityCode,
      this.sendWelcomeEmail,
      this.personId,
      this.positionId,
      this.departmentId,
      this.name,
      this.email,
      this.jobTitle,
      this.password,
      this.photoId,
      this.mobile,
      this.forgotPasswordOTP,
      this.passwordChanged,
      this.isSystemAdmin,
      this.isGuestUser,
      this.userRoles,
      this.userPermissions,
      this.signatureId,
      this.enableRegularEmail,
      this.enableSummaryEmail,
      this.lineManagerId,
      this.activationCode,
      this.legalEntityIds,
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

  User.fromJson(Map<String, dynamic> json) {
    createdByName = json['CreatedByName'];
    lastUpdatedByName = json['LastUpdatedByName'];
    companyName = json['CompanyName'];
    companyCode = json['CompanyCode'];
    confirmPassword = json['ConfirmPassword'];
    userName = json['UserName'];
    lastName = json['LastName'];
    returnUrl = json['ReturnUrl'];
    layout = json['Layout'];
    portal = json['Portal'];
    portalName = json['PortalName'];
    userType = json['UserType'];
    test = json['Test'];
    userPortals = json['UserPortals'];
    legalEntityCode = json['LegalEntityCode'];
    sendWelcomeEmail = json['SendWelcomeEmail'];
    personId = json['PersonId'];
    positionId = json['PositionId'];
    departmentId = json['DepartmentId'];
    name = json['Name'];
    email = json['Email'];
    jobTitle = json['JobTitle'];
    password = json['Password'];
    photoId = json['PhotoId'];
    mobile = json['Mobile'];
    forgotPasswordOTP = json['ForgotPasswordOTP'];
    passwordChanged = json['PasswordChanged'];
    isSystemAdmin = json['IsSystemAdmin'];
    isGuestUser = json['IsGuestUser'];
    userRoles = json['UserRoles'];
    userPermissions = json['UserPermissions'];
    signatureId = json['SignatureId'];
    enableRegularEmail = json['EnableRegularEmail'];
    enableSummaryEmail = json['EnableSummaryEmail'];
    lineManagerId = json['LineManagerId'];
    activationCode = json['ActivationCode'];
    legalEntityIds = json['LegalEntityIds'].cast<String>();
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
    data['CreatedByName'] = this.createdByName;
    data['LastUpdatedByName'] = this.lastUpdatedByName;
    data['CompanyName'] = this.companyName;
    data['CompanyCode'] = this.companyCode;
    data['ConfirmPassword'] = this.confirmPassword;
    data['UserName'] = this.userName;
    data['LastName'] = this.lastName;
    data['ReturnUrl'] = this.returnUrl;
    data['Layout'] = this.layout;
    data['Portal'] = this.portal;
    data['PortalName'] = this.portalName;
    data['UserType'] = this.userType;
    data['Test'] = this.test;
    data['UserPortals'] = this.userPortals;
    data['LegalEntityCode'] = this.legalEntityCode;
    data['SendWelcomeEmail'] = this.sendWelcomeEmail;
    data['PersonId'] = this.personId;
    data['PositionId'] = this.positionId;
    data['DepartmentId'] = this.departmentId;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['JobTitle'] = this.jobTitle;
    data['Password'] = this.password;
    data['PhotoId'] = this.photoId;
    data['Mobile'] = this.mobile;
    data['ForgotPasswordOTP'] = this.forgotPasswordOTP;
    data['PasswordChanged'] = this.passwordChanged;
    data['IsSystemAdmin'] = this.isSystemAdmin;
    data['IsGuestUser'] = this.isGuestUser;
    data['UserRoles'] = this.userRoles;
    data['UserPermissions'] = this.userPermissions;
    data['SignatureId'] = this.signatureId;
    data['EnableRegularEmail'] = this.enableRegularEmail;
    data['EnableSummaryEmail'] = this.enableSummaryEmail;
    data['LineManagerId'] = this.lineManagerId;
    data['ActivationCode'] = this.activationCode;
    data['LegalEntityIds'] = this.legalEntityIds;
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