// ignore_for_file: prefer_collection_literals

class User {
  String? createdByName;
  String? lastUpdatedByName;
  String? companyName;
  String? companyCode;
  String? confirmPassword;
  String? userName;
  String? lastName;
  String? returnUrl;
  String? layout;
  String? portal;
  String? portalName;
  String? userType;
  String? test;
  String? userPortals;
  String? legalEntityCode;
  bool? sendWelcomeEmail;
  String? personId;
  String? positionId;
  String? departmentId;
  String? name;
  String? email;
  String? jobTitle;
  String? password;
  String? photoId;
  String? mobile;
  String? forgotPasswordOTP;
  bool? passwordChanged;
  bool? isSystemAdmin;
  bool? isGuestUser;
  String? userRoles;
  String? userPermissions;
  String? signatureId;
  bool? enableRegularEmail;
  bool? enableSummaryEmail;
  String? lineManagerId;
  String? activationCode;
  List<String>? legalEntityIds;
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
    if (json['LegalEntityIds'] != null && json['LegalEntityIds'].length > 0) {
      legalEntityIds = json['LegalEntityIds'].cast<String>();
    }
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
    final Map<String, dynamic>? data =  Map<String, dynamic>();
    data!['CreatedByName'] = createdByName;
    data['LastUpdatedByName'] = lastUpdatedByName;
    data['CompanyName'] = companyName;
    data['CompanyCode'] = companyCode;
    data['ConfirmPassword'] = confirmPassword;
    data['UserName'] = userName;
    data['LastName'] = lastName;
    data['ReturnUrl'] = returnUrl;
    data['Layout'] = layout;
    data['Portal'] = portal;
    data['PortalName'] = portalName;
    data['UserType'] = userType;
    data['Test'] = test;
    data['UserPortals'] = userPortals;
    data['LegalEntityCode'] = legalEntityCode;
    data['SendWelcomeEmail'] = sendWelcomeEmail;
    data['PersonId'] = personId;
    data['PositionId'] = positionId;
    data['DepartmentId'] = departmentId;
    data['Name'] = name;
    data['Email'] = email;
    data['JobTitle'] = jobTitle;
    data['Password'] = password;
    data['PhotoId'] = photoId;
    data['Mobile'] = mobile;
    data['ForgotPasswordOTP'] = forgotPasswordOTP;
    data['PasswordChanged'] = passwordChanged;
    data['IsSystemAdmin'] = isSystemAdmin;
    data['IsGuestUser'] = isGuestUser;
    data['UserRoles'] = userRoles;
    data['UserPermissions'] = userPermissions;
    data['SignatureId'] = signatureId;
    data['EnableRegularEmail'] = enableRegularEmail;
    data['EnableSummaryEmail'] = enableSummaryEmail;
    data['LineManagerId'] = lineManagerId;
    data['ActivationCode'] = activationCode;
    data['LegalEntityIds'] = legalEntityIds;
    data['Id'] = id;
    data['CreatedDate'] = createdDate;
    data['CreatedBy'] = createdBy;
    data['LastUpdatedDate'] = lastUpdatedDate;
    data['LastUpdatedBy'] = lastUpdatedBy;
    data['IsDeleted'] = isDeleted;
    data['SequenceOrder'] = sequenceOrder;
    data['CompanyId'] = companyId;
    data['LegalEntityId'] = legalEntityId;
    data['DataAction'] = dataAction;
    data['Status'] = status;
    data['VersionNo'] = versionNo;
    data['PortalId'] = portalId;
    return data;
  }
}
