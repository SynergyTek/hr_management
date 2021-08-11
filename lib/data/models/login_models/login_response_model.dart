import 'dart:convert';

import 'package:flutter/foundation.dart';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  String companyId;
  String userUniqueId;
  String companyCode;
  String jobTitle;
  String photoId;
  String userRoleIds;
  String userPortals;
  String userRoleCodes;
  String companyName;
  bool isSystemAdmin;
  bool isGuestUser;
  dynamic portalId;
  dynamic portalTheme;
  List<Claim> claims;
  dynamic loggedInAsType;
  dynamic loggedInAsByUserId;
  dynamic loggedInAsByUserName;
  dynamic cultureName;
  String legalEntityId;
  String legalEntityCode;
  String personId;
  String positionId;
  String departmentId;
  String id;
  String userName;
  dynamic normalizedUserName;
  String email;
  dynamic normalizedEmail;
  bool emailConfirmed;
  dynamic passwordHash;
  String securityStamp;
  String concurrencyStamp;
  dynamic phoneNumber;
  bool phoneNumberConfirmed;
  bool twoFactorEnabled;
  dynamic lockoutEnd;
  bool lockoutEnabled;
  int accessFailedCount;

  LoginResponseModel({
    this.companyId,
    this.userUniqueId,
    this.companyCode,
    this.jobTitle,
    this.photoId,
    this.userRoleIds,
    this.userPortals,
    this.userRoleCodes,
    this.companyName,
    this.isSystemAdmin,
    this.isGuestUser,
    this.portalId,
    this.portalTheme,
    this.claims,
    this.loggedInAsType,
    this.loggedInAsByUserId,
    this.loggedInAsByUserName,
    this.cultureName,
    this.legalEntityId,
    this.legalEntityCode,
    this.personId,
    this.positionId,
    this.departmentId,
    this.id,
    this.userName,
    this.normalizedUserName,
    this.email,
    this.normalizedEmail,
    this.emailConfirmed,
    this.passwordHash,
    this.securityStamp,
    this.concurrencyStamp,
    this.phoneNumber,
    this.phoneNumberConfirmed,
    this.twoFactorEnabled,
    this.lockoutEnd,
    this.lockoutEnabled,
    this.accessFailedCount,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        companyId: json["CompanyId"],
        userUniqueId: json["UserUniqueId"],
        companyCode: json["CompanyCode"],
        jobTitle: json["JobTitle"],
        photoId: json["PhotoId"],
        userRoleIds: json["UserRoleIds"],
        userPortals: json["UserPortals"],
        userRoleCodes: json["UserRoleCodes"],
        companyName: json["CompanyName"],
        isSystemAdmin: json["IsSystemAdmin"],
        isGuestUser: json["IsGuestUser"],
        portalId: json["PortalId"],
        portalTheme: json["PortalTheme"],
        claims: List<Claim>.from(json["Claims"].map((x) => Claim.fromJson(x))),
        loggedInAsType: json["LoggedInAsType"],
        loggedInAsByUserId: json["LoggedInAsByUserId"],
        loggedInAsByUserName: json["LoggedInAsByUserName"],
        cultureName: json["CultureName"],
        legalEntityId: json["LegalEntityId"],
        legalEntityCode: json["LegalEntityCode"],
        personId: json["PersonId"],
        positionId: json["PositionId"],
        departmentId: json["DepartmentId"],
        id: json["Id"],
        userName: json["UserName"],
        normalizedUserName: json["NormalizedUserName"],
        email: json["Email"],
        normalizedEmail: json["NormalizedEmail"],
        emailConfirmed: json["EmailConfirmed"],
        passwordHash: json["PasswordHash"],
        securityStamp: json["SecurityStamp"],
        concurrencyStamp: json["ConcurrencyStamp"],
        phoneNumber: json["PhoneNumber"],
        phoneNumberConfirmed: json["PhoneNumberConfirmed"],
        twoFactorEnabled: json["TwoFactorEnabled"],
        lockoutEnd: json["LockoutEnd"],
        lockoutEnabled: json["LockoutEnabled"],
        accessFailedCount: json["AccessFailedCount"],
      );

  Map<String, dynamic> toJson() => {
        "CompanyId": companyId,
        "UserUniqueId": userUniqueId,
        "CompanyCode": companyCode,
        "JobTitle": jobTitle,
        "PhotoId": photoId,
        "UserRoleIds": userRoleIds,
        "UserPortals": userPortals,
        "UserRoleCodes": userRoleCodes,
        "CompanyName": companyName,
        "IsSystemAdmin": isSystemAdmin,
        "IsGuestUser": isGuestUser,
        "PortalId": portalId,
        "PortalTheme": portalTheme,
        "Claims": List<dynamic>.from(claims.map((x) => x.toJson())),
        "LoggedInAsType": loggedInAsType,
        "LoggedInAsByUserId": loggedInAsByUserId,
        "LoggedInAsByUserName": loggedInAsByUserName,
        "CultureName": cultureName,
        "LegalEntityId": legalEntityId,
        "LegalEntityCode": legalEntityCode,
        "PersonId": personId,
        "PositionId": positionId,
        "DepartmentId": departmentId,
        "Id": id,
        "UserName": userName,
        "NormalizedUserName": normalizedUserName,
        "Email": email,
        "NormalizedEmail": normalizedEmail,
        "EmailConfirmed": emailConfirmed,
        "PasswordHash": passwordHash,
        "SecurityStamp": securityStamp,
        "ConcurrencyStamp": concurrencyStamp,
        "PhoneNumber": phoneNumber,
        "PhoneNumberConfirmed": phoneNumberConfirmed,
        "TwoFactorEnabled": twoFactorEnabled,
        "LockoutEnd": lockoutEnd,
        "LockoutEnabled": lockoutEnabled,
        "AccessFailedCount": accessFailedCount,
      };

  LoginResponseModel copyWith({
    String companyId,
    String userUniqueId,
    String companyCode,
    String jobTitle,
    String photoId,
    String userRoleIds,
    String userPortals,
    String userRoleCodes,
    String companyName,
    bool isSystemAdmin,
    bool isGuestUser,
    dynamic portalId,
    dynamic portalTheme,
    List<Claim> claims,
    dynamic loggedInAsType,
    dynamic loggedInAsByUserId,
    dynamic loggedInAsByUserName,
    dynamic cultureName,
    String legalEntityId,
    String legalEntityCode,
    String personId,
    String positionId,
    String departmentId,
    String id,
    String userName,
    dynamic normalizedUserName,
    String email,
    dynamic normalizedEmail,
    bool emailConfirmed,
    dynamic passwordHash,
    String securityStamp,
    String concurrencyStamp,
    dynamic phoneNumber,
    bool phoneNumberConfirmed,
    bool twoFactorEnabled,
    dynamic lockoutEnd,
    bool lockoutEnabled,
    int accessFailedCount,
  }) {
    return LoginResponseModel(
      companyId: companyId ?? this.companyId,
      userUniqueId: userUniqueId ?? this.userUniqueId,
      companyCode: companyCode ?? this.companyCode,
      jobTitle: jobTitle ?? this.jobTitle,
      photoId: photoId ?? this.photoId,
      userRoleIds: userRoleIds ?? this.userRoleIds,
      userPortals: userPortals ?? this.userPortals,
      userRoleCodes: userRoleCodes ?? this.userRoleCodes,
      companyName: companyName ?? this.companyName,
      isSystemAdmin: isSystemAdmin ?? this.isSystemAdmin,
      isGuestUser: isGuestUser ?? this.isGuestUser,
      portalId: portalId ?? this.portalId,
      portalTheme: portalTheme ?? this.portalTheme,
      claims: claims ?? this.claims,
      loggedInAsType: loggedInAsType ?? this.loggedInAsType,
      loggedInAsByUserId: loggedInAsByUserId ?? this.loggedInAsByUserId,
      loggedInAsByUserName: loggedInAsByUserName ?? this.loggedInAsByUserName,
      cultureName: cultureName ?? this.cultureName,
      legalEntityId: legalEntityId ?? this.legalEntityId,
      legalEntityCode: legalEntityCode ?? this.legalEntityCode,
      personId: personId ?? this.personId,
      positionId: positionId ?? this.positionId,
      departmentId: departmentId ?? this.departmentId,
      id: id ?? this.id,
      userName: userName ?? this.userName,
      normalizedUserName: normalizedUserName ?? this.normalizedUserName,
      email: email ?? this.email,
      normalizedEmail: normalizedEmail ?? this.normalizedEmail,
      emailConfirmed: emailConfirmed ?? this.emailConfirmed,
      passwordHash: passwordHash ?? this.passwordHash,
      securityStamp: securityStamp ?? this.securityStamp,
      concurrencyStamp: concurrencyStamp ?? this.concurrencyStamp,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneNumberConfirmed: phoneNumberConfirmed ?? this.phoneNumberConfirmed,
      twoFactorEnabled: twoFactorEnabled ?? this.twoFactorEnabled,
      lockoutEnd: lockoutEnd ?? this.lockoutEnd,
      lockoutEnabled: lockoutEnabled ?? this.lockoutEnabled,
      accessFailedCount: accessFailedCount ?? this.accessFailedCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'companyId': companyId,
      'userUniqueId': userUniqueId,
      'companyCode': companyCode,
      'jobTitle': jobTitle,
      'photoId': photoId,
      'userRoleIds': userRoleIds,
      'userPortals': userPortals,
      'userRoleCodes': userRoleCodes,
      'companyName': companyName,
      'isSystemAdmin': isSystemAdmin,
      'isGuestUser': isGuestUser,
      'portalId': portalId,
      'portalTheme': portalTheme,
      // 'claims': claims?.map((x) => x.toMap())?.toList(),
      'claims': null,
      'loggedInAsType': loggedInAsType,
      'loggedInAsByUserId': loggedInAsByUserId,
      'loggedInAsByUserName': loggedInAsByUserName,
      'cultureName': cultureName,
      'legalEntityId': legalEntityId,
      'legalEntityCode': legalEntityCode,
      'personId': personId,
      'positionId': positionId,
      'departmentId': departmentId,
      'id': id,
      'userName': userName,
      'normalizedUserName': normalizedUserName,
      'email': email,
      'normalizedEmail': normalizedEmail,
      'emailConfirmed': emailConfirmed,
      'passwordHash': passwordHash,
      'securityStamp': securityStamp,
      'concurrencyStamp': concurrencyStamp,
      'phoneNumber': phoneNumber,
      'phoneNumberConfirmed': phoneNumberConfirmed,
      'twoFactorEnabled': twoFactorEnabled,
      'lockoutEnd': lockoutEnd,
      'lockoutEnabled': lockoutEnabled,
      'accessFailedCount': accessFailedCount,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      companyId: map['companyId'],
      userUniqueId: map['userUniqueId'],
      companyCode: map['companyCode'],
      jobTitle: map['jobTitle'],
      photoId: map['photoId'],
      userRoleIds: map['userRoleIds'],
      userPortals: map['userPortals'],
      userRoleCodes: map['userRoleCodes'],
      companyName: map['companyName'],
      isSystemAdmin: map['isSystemAdmin'],
      isGuestUser: map['isGuestUser'],
      portalId: map['portalId'],
      portalTheme: map['portalTheme'],
      claims: null,
      // claims: List<Claim>.from(map['claims']?.map((x) => Claim.fromMap(x))),
      loggedInAsType: map['loggedInAsType'],
      loggedInAsByUserId: map['loggedInAsByUserId'],
      loggedInAsByUserName: map['loggedInAsByUserName'],
      cultureName: map['cultureName'],
      legalEntityId: map['legalEntityId'],
      legalEntityCode: map['legalEntityCode'],
      personId: map['personId'],
      positionId: map['positionId'],
      departmentId: map['departmentId'],
      id: map['id'],
      userName: map['userName'],
      normalizedUserName: map['normalizedUserName'],
      email: map['email'],
      normalizedEmail: map['normalizedEmail'],
      emailConfirmed: map['emailConfirmed'],
      passwordHash: map['passwordHash'],
      securityStamp: map['securityStamp'],
      concurrencyStamp: map['concurrencyStamp'],
      phoneNumber: map['phoneNumber'],
      phoneNumberConfirmed: map['phoneNumberConfirmed'],
      twoFactorEnabled: map['twoFactorEnabled'],
      lockoutEnd: map['lockoutEnd'],
      lockoutEnabled: map['lockoutEnabled'],
      accessFailedCount: map['accessFailedCount'],
    );
  }

  @override
  String toString() {
    return 'LoginResponseModel(companyId: $companyId, userUniqueId: $userUniqueId, companyCode: $companyCode, jobTitle: $jobTitle, photoId: $photoId, userRoleIds: $userRoleIds, userPortals: $userPortals, userRoleCodes: $userRoleCodes, companyName: $companyName, isSystemAdmin: $isSystemAdmin, isGuestUser: $isGuestUser, portalId: $portalId, portalTheme: $portalTheme, claims: $claims, loggedInAsType: $loggedInAsType, loggedInAsByUserId: $loggedInAsByUserId, loggedInAsByUserName: $loggedInAsByUserName, cultureName: $cultureName, legalEntityId: $legalEntityId, legalEntityCode: $legalEntityCode, personId: $personId, positionId: $positionId, departmentId: $departmentId, id: $id, userName: $userName, normalizedUserName: $normalizedUserName, email: $email, normalizedEmail: $normalizedEmail, emailConfirmed: $emailConfirmed, passwordHash: $passwordHash, securityStamp: $securityStamp, concurrencyStamp: $concurrencyStamp, phoneNumber: $phoneNumber, phoneNumberConfirmed: $phoneNumberConfirmed, twoFactorEnabled: $twoFactorEnabled, lockoutEnd: $lockoutEnd, lockoutEnabled: $lockoutEnabled, accessFailedCount: $accessFailedCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponseModel &&
        other.companyId == companyId &&
        other.userUniqueId == userUniqueId &&
        other.companyCode == companyCode &&
        other.jobTitle == jobTitle &&
        other.photoId == photoId &&
        other.userRoleIds == userRoleIds &&
        other.userPortals == userPortals &&
        other.userRoleCodes == userRoleCodes &&
        other.companyName == companyName &&
        other.isSystemAdmin == isSystemAdmin &&
        other.isGuestUser == isGuestUser &&
        other.portalId == portalId &&
        other.portalTheme == portalTheme &&
        listEquals(other.claims, claims) &&
        other.loggedInAsType == loggedInAsType &&
        other.loggedInAsByUserId == loggedInAsByUserId &&
        other.loggedInAsByUserName == loggedInAsByUserName &&
        other.cultureName == cultureName &&
        other.legalEntityId == legalEntityId &&
        other.legalEntityCode == legalEntityCode &&
        other.personId == personId &&
        other.positionId == positionId &&
        other.departmentId == departmentId &&
        other.id == id &&
        other.userName == userName &&
        other.normalizedUserName == normalizedUserName &&
        other.email == email &&
        other.normalizedEmail == normalizedEmail &&
        other.emailConfirmed == emailConfirmed &&
        other.passwordHash == passwordHash &&
        other.securityStamp == securityStamp &&
        other.concurrencyStamp == concurrencyStamp &&
        other.phoneNumber == phoneNumber &&
        other.phoneNumberConfirmed == phoneNumberConfirmed &&
        other.twoFactorEnabled == twoFactorEnabled &&
        other.lockoutEnd == lockoutEnd &&
        other.lockoutEnabled == lockoutEnabled &&
        other.accessFailedCount == accessFailedCount;
  }

  @override
  int get hashCode {
    return companyId.hashCode ^
        userUniqueId.hashCode ^
        companyCode.hashCode ^
        jobTitle.hashCode ^
        photoId.hashCode ^
        userRoleIds.hashCode ^
        userPortals.hashCode ^
        userRoleCodes.hashCode ^
        companyName.hashCode ^
        isSystemAdmin.hashCode ^
        isGuestUser.hashCode ^
        portalId.hashCode ^
        portalTheme.hashCode ^
        claims.hashCode ^
        loggedInAsType.hashCode ^
        loggedInAsByUserId.hashCode ^
        loggedInAsByUserName.hashCode ^
        cultureName.hashCode ^
        legalEntityId.hashCode ^
        legalEntityCode.hashCode ^
        personId.hashCode ^
        positionId.hashCode ^
        departmentId.hashCode ^
        id.hashCode ^
        userName.hashCode ^
        normalizedUserName.hashCode ^
        email.hashCode ^
        normalizedEmail.hashCode ^
        emailConfirmed.hashCode ^
        passwordHash.hashCode ^
        securityStamp.hashCode ^
        concurrencyStamp.hashCode ^
        phoneNumber.hashCode ^
        phoneNumberConfirmed.hashCode ^
        twoFactorEnabled.hashCode ^
        lockoutEnd.hashCode ^
        lockoutEnabled.hashCode ^
        accessFailedCount.hashCode;
  }
}

class Claim {
  Issuer issuer;
  Issuer originalIssuer;
  Properties properties;
  dynamic subject;
  String type;
  String value;
  String valueType;

  Claim({
    this.issuer,
    this.originalIssuer,
    this.properties,
    this.subject,
    this.type,
    this.value,
    this.valueType,
  });

  factory Claim.fromJson(Map<String, dynamic> json) => Claim(
        issuer: issuerValues.map[json["Issuer"]],
        originalIssuer: issuerValues.map[json["OriginalIssuer"]],
        properties: Properties.fromJson(json["Properties"]),
        subject: json["Subject"],
        type: json["Type"],
        value: json["Value"],
        valueType: json["ValueType"],
      );

  Map<String, dynamic> toJson() => {
        "Issuer": issuerValues.reverse[issuer],
        "OriginalIssuer": issuerValues.reverse[originalIssuer],
        "Properties": properties.toJson(),
        "Subject": subject,
        "Type": type,
        "Value": value,
        "ValueType": valueType,
      };

  Claim copyWith({
    Issuer issuer,
    Issuer originalIssuer,
    Properties properties,
    dynamic subject,
    String type,
    String value,
    String valueType,
  }) {
    return Claim(
      issuer: issuer ?? this.issuer,
      originalIssuer: originalIssuer ?? this.originalIssuer,
      properties: properties ?? this.properties,
      subject: subject ?? this.subject,
      type: type ?? this.type,
      value: value ?? this.value,
      valueType: valueType ?? this.valueType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'issuer': issuer,
      'originalIssuer': originalIssuer,
      'properties': properties,
      'subject': subject,
      'type': type,
      'value': value,
      'valueType': valueType,
    };
  }

  factory Claim.fromMap(Map<String, dynamic> map) {
    return Claim(
      issuer: map['issuer'],
      originalIssuer: map['originalIssuer'],
      properties: map['properties'],
      subject: map['subject'],
      type: map['type'],
      value: map['value'],
      valueType: map['valueType'],
    );
  }

  @override
  String toString() {
    return 'Claim(issuer: $issuer, originalIssuer: $originalIssuer, properties: $properties, subject: $subject, type: $type, value: $value, valueType: $valueType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Claim &&
        other.issuer == issuer &&
        other.originalIssuer == originalIssuer &&
        other.properties == properties &&
        other.subject == subject &&
        other.type == type &&
        other.value == value &&
        other.valueType == valueType;
  }

  @override
  int get hashCode {
    return issuer.hashCode ^
        originalIssuer.hashCode ^
        properties.hashCode ^
        subject.hashCode ^
        type.hashCode ^
        value.hashCode ^
        valueType.hashCode;
  }
}

enum Issuer { LOCAL_AUTHORITY }

final issuerValues = EnumValues({"LOCAL AUTHORITY": Issuer.LOCAL_AUTHORITY});

class Properties {
  Properties();

  factory Properties.fromJson(Map<String, dynamic> json) => Properties();

  Map<String, dynamic> toJson() => {};
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
