import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
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

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
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
}

class Claim {
    Claim({
        this.issuer,
        this.originalIssuer,
        this.properties,
        this.subject,
        this.type,
        this.value,
        this.valueType,
    });

    Issuer issuer;
    Issuer originalIssuer;
    Properties properties;
    dynamic subject;
    String type;
    String value;
    String valueType;

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
}

enum Issuer { LOCAL_AUTHORITY }

final issuerValues = EnumValues({
    "LOCAL AUTHORITY": Issuer.LOCAL_AUTHORITY
});

class Properties {
    Properties();

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    );

    Map<String, dynamic> toJson() => {
    };
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
