class DMSLegalEntityModel {
  dynamic countryName;
  dynamic fiscalYearStartMonth;
  dynamic fiscalYearEndMonth;
  dynamic fiscalYearType;
  String? name;
  String? nameLocal;
  String? code;
  String? address;
  String? phone;
  String? fax;
  String? email;
  String? primaryContactPerson;
  String? secondaryContactPerson;
  String? primaryContactEmail;
  String? secondaryContactEmail;
  String? primaryContactMobile;
  String? secondaryContactMobile;
  String? primaryContactPhone;
  String? secondaryContactPhone;
  String? cultureInfo;
  String? dateFormat;
  String? dateTimeFormat;
  String? currencySymbol;
  String? currencyName;
  String? timeZone;
  String? logoFileId;
  String? licenseKey;
  bool? sendCompanyWelcome;
  String? countryId;
  String? contactPerson;
  String? contactPersonEmail;
  String? contactPersonMobile;
  String? basicSalaryPercentage;
  String? housingAllowancePercentage;
  String? transportAllowancePercentage;
  String? id;
  String? createdDate;
  String? createdBy;
  String? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  dynamic sequenceOrder;
  String? companyId;
  dynamic legalEntityId;
  String? dataAction;
  String? status;
  String? versionNo;
  dynamic portalId;

  DMSLegalEntityModel({
    this.countryName,
    this.fiscalYearStartMonth,
    this.fiscalYearEndMonth,
    this.fiscalYearType,
    this.name,
    this.nameLocal,
    this.code,
    this.address,
    this.phone,
    this.fax,
    this.email,
    this.primaryContactPerson,
    this.secondaryContactPerson,
    this.primaryContactEmail,
    this.secondaryContactEmail,
    this.primaryContactMobile,
    this.secondaryContactMobile,
    this.primaryContactPhone,
    this.secondaryContactPhone,
    this.cultureInfo,
    this.dateFormat,
    this.dateTimeFormat,
    this.currencySymbol,
    this.currencyName,
    this.timeZone,
    this.logoFileId,
    this.licenseKey,
    this.sendCompanyWelcome,
    this.countryId,
    this.contactPerson,
    this.contactPersonEmail,
    this.contactPersonMobile,
    this.basicSalaryPercentage,
    this.housingAllowancePercentage,
    this.transportAllowancePercentage,
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
    this.portalId,
  });

  DMSLegalEntityModel.fromJson(Map<String, dynamic> json) {
    countryName = json['CountryName'];
    fiscalYearStartMonth = json['FiscalYearStartMonth'];
    fiscalYearEndMonth = json['FiscalYearEndMonth'];
    fiscalYearType = json['FiscalYearType'];
    name = json['Name'];
    nameLocal = json['NameLocal'];
    code = json['Code'];
    address = json['Address'];
    phone = json['Phone'];
    fax = json['Fax'];
    email = json['Email'];
    primaryContactPerson = json['PrimaryContactPerson'];
    secondaryContactPerson = json['SecondaryContactPerson'];
    primaryContactEmail = json['PrimaryContactEmail'];
    secondaryContactEmail = json['SecondaryContactEmail'];
    primaryContactMobile = json['PrimaryContactMobile'];
    secondaryContactMobile = json['SecondaryContactMobile'];
    primaryContactPhone = json['PrimaryContactPhone'];
    secondaryContactPhone = json['SecondaryContactPhone'];
    cultureInfo = json['CultureInfo'];
    dateFormat = json['DateFormat'];
    dateTimeFormat = json['DateTimeFormat'];
    currencySymbol = json['CurrencySymbol'];
    currencyName = json['CurrencyName'];
    timeZone = json['TimeZone'];
    logoFileId = json['LogoFileId'];
    licenseKey = json['LicenseKey'];
    sendCompanyWelcome = json['SendCompanyWelcome'];
    countryId = json['CountryId'];
    contactPerson = json['ContactPerson'];
    contactPersonEmail = json['ContactPersonEmail'];
    contactPersonMobile = json['ContactPersonMobile'];
    basicSalaryPercentage = json['BasicSalaryPercentage'].toString();
    housingAllowancePercentage = json['HousingAllowancePercentage'].toString();
    transportAllowancePercentage =
        json['TransportAllowancePercentage'].toString();
    id = json['Id'];
    createdDate = json['CreatedDate'];
    createdBy = json['CreatedBy'];
    lastUpdatedDate = json['LastUpdatedDate'];
    lastUpdatedBy = json['LastUpdatedBy'];
    isDeleted = json['IsDeleted'];
    sequenceOrder = json['SequenceOrder'];
    companyId = json['CompanyId'];
    legalEntityId = json['LegalEntityId'];
    dataAction = json['DataAction'].toString();
    status = json['Status'].toString();
    versionNo = json['VersionNo'].toString();
    portalId = json['PortalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CountryName'] = this.countryName;
    data['FiscalYearStartMonth'] = this.fiscalYearStartMonth;
    data['FiscalYearEndMonth'] = this.fiscalYearEndMonth;
    data['FiscalYearType'] = this.fiscalYearType;
    data['Name'] = this.name;
    data['NameLocal'] = this.nameLocal;
    data['Code'] = this.code;
    data['Address'] = this.address;
    data['Phone'] = this.phone;
    data['Fax'] = this.fax;
    data['Email'] = this.email;
    data['PrimaryContactPerson'] = this.primaryContactPerson;
    data['SecondaryContactPerson'] = this.secondaryContactPerson;
    data['PrimaryContactEmail'] = this.primaryContactEmail;
    data['SecondaryContactEmail'] = this.secondaryContactEmail;
    data['PrimaryContactMobile'] = this.primaryContactMobile;
    data['SecondaryContactMobile'] = this.secondaryContactMobile;
    data['PrimaryContactPhone'] = this.primaryContactPhone;
    data['SecondaryContactPhone'] = this.secondaryContactPhone;
    data['CultureInfo'] = this.cultureInfo;
    data['DateFormat'] = this.dateFormat;
    data['DateTimeFormat'] = this.dateTimeFormat;
    data['CurrencySymbol'] = this.currencySymbol;
    data['CurrencyName'] = this.currencyName;
    data['TimeZone'] = this.timeZone;
    data['LogoFileId'] = this.logoFileId;
    data['LicenseKey'] = this.licenseKey;
    data['SendCompanyWelcome'] = this.sendCompanyWelcome;
    data['CountryId'] = this.countryId;
    data['ContactPerson'] = this.contactPerson;
    data['ContactPersonEmail'] = this.contactPersonEmail;
    data['ContactPersonMobile'] = this.contactPersonMobile;
    data['BasicSalaryPercentage'] = this.basicSalaryPercentage;
    data['HousingAllowancePercentage'] = this.housingAllowancePercentage;
    data['TransportAllowancePercentage'] = this.transportAllowancePercentage;
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
