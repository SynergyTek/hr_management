// class UserPermissionModel {
//   dynamic columns;
//   dynamic userRoleColumns;
//   dynamic pageType;
//   String? userName;
//   String? portalName;
//   String? pageName;
//   String? permission;
//   String? type;
//   dynamic permission1;
//   dynamic permission2;
//   dynamic permission3;
//   dynamic permission4;
//   dynamic permission5;
//   dynamic permission6;
//   dynamic permission7;
//   dynamic permission8;
//   dynamic permission9;
//   dynamic permission10;
//   dynamic permission11;
//   dynamic permission12;
//   dynamic permission13;
//   dynamic permission14;
//   dynamic permission15;
//   dynamic permission16;
//   dynamic permission17;
//   dynamic permission18;
//   dynamic permission19;
//   dynamic permission20;
//   bool? check1;
//   bool? check2;
//   bool? check3;
//   bool? check4;
//   bool? check5;
//   bool? check6;
//   bool? check7;
//   bool? check8;
//   bool? check9;
//   bool? check10;
//   bool? check11;
//   bool? check12;
//   bool? check13;
//   bool? check14;
//   bool? check15;
//   bool? check16;
//   bool? check17;
//   bool? check18;
//   bool? check19;
//   bool? check20;
//   dynamic userId;
//   dynamic user;
//   dynamic pageId;
//   dynamic page;
//   List<String>? permissions;
//   dynamic id;
//   String? createdDate;
//   dynamic createdBy;
//   String? lastUpdatedDate;
//   dynamic lastUpdatedBy;
//   bool? isDeleted;
//   dynamic sequenceOrder;
//   dynamic companyId;
//   dynamic legalEntityId;
//   int? dataAction;
//   int? status;
//   int? versionNo;
//   dynamic portalId;

//   UserPermissionModel(
//       {this.columns,
//       this.userRoleColumns,
//       this.pageType,
//       this.userName,
//       this.portalName,
//       this.pageName,
//       this.permission,
//       this.type,
//       this.permission1,
//       this.permission2,
//       this.permission3,
//       this.permission4,
//       this.permission5,
//       this.permission6,
//       this.permission7,
//       this.permission8,
//       this.permission9,
//       this.permission10,
//       this.permission11,
//       this.permission12,
//       this.permission13,
//       this.permission14,
//       this.permission15,
//       this.permission16,
//       this.permission17,
//       this.permission18,
//       this.permission19,
//       this.permission20,
//       this.check1,
//       this.check2,
//       this.check3,
//       this.check4,
//       this.check5,
//       this.check6,
//       this.check7,
//       this.check8,
//       this.check9,
//       this.check10,
//       this.check11,
//       this.check12,
//       this.check13,
//       this.check14,
//       this.check15,
//       this.check16,
//       this.check17,
//       this.check18,
//       this.check19,
//       this.check20,
//       this.userId,
//       this.user,
//       this.pageId,
//       this.page,
//       this.permissions,
//       this.id,
//       this.createdDate,
//       this.createdBy,
//       this.lastUpdatedDate,
//       this.lastUpdatedBy,
//       this.isDeleted,
//       this.sequenceOrder,
//       this.companyId,
//       this.legalEntityId,
//       this.dataAction,
//       this.status,
//       this.versionNo,
//       this.portalId});

//   UserPermissionModel.fromJson(Map<String, dynamic> json) {
//     columns = json['Columns'];
//     userRoleColumns = json['UserRoleColumns'];
//     pageType = json['PageType'];
//     userName = json['UserName'];
//     portalName = json['PortalName'];
//     pageName = json['PageName'];
//     permission = json['Permission'];
//     type = json['Type'];
//     permission1 = json['Permission1'];
//     permission2 = json['Permission2'];
//     permission3 = json['Permission3'];
//     permission4 = json['Permission4'];
//     permission5 = json['Permission5'];
//     permission6 = json['Permission6'];
//     permission7 = json['Permission7'];
//     permission8 = json['Permission8'];
//     permission9 = json['Permission9'];
//     permission10 = json['Permission10'];
//     permission11 = json['Permission11'];
//     permission12 = json['Permission12'];
//     permission13 = json['Permission13'];
//     permission14 = json['Permission14'];
//     permission15 = json['Permission15'];
//     permission16 = json['Permission16'];
//     permission17 = json['Permission17'];
//     permission18 = json['Permission18'];
//     permission19 = json['Permission19'];
//     permission20 = json['Permission20'];
//     check1 = json['Check1'];
//     check2 = json['Check2'];
//     check3 = json['Check3'];
//     check4 = json['Check4'];
//     check5 = json['Check5'];
//     check6 = json['Check6'];
//     check7 = json['Check7'];
//     check8 = json['Check8'];
//     check9 = json['Check9'];
//     check10 = json['Check10'];
//     check11 = json['Check11'];
//     check12 = json['Check12'];
//     check13 = json['Check13'];
//     check14 = json['Check14'];
//     check15 = json['Check15'];
//     check16 = json['Check16'];
//     check17 = json['Check17'];
//     check18 = json['Check18'];
//     check19 = json['Check19'];
//     check20 = json['Check20'];
//     userId = json['UserId'];
//     user = json['User'];
//     pageId = json['PageId'];
//     page = json['Page'];
//     permissions = json['Permissions'].cast<String>();
//     id = json['Id'];
//     createdDate = json['CreatedDate'];
//     createdBy = json['CreatedBy'];
//     lastUpdatedDate = json['LastUpdatedDate'];
//     lastUpdatedBy = json['LastUpdatedBy'];
//     isDeleted = json['IsDeleted'];
//     sequenceOrder = json['SequenceOrder'];
//     companyId = json['CompanyId'];
//     legalEntityId = json['LegalEntityId'];
//     dataAction = json['DataAction'];
//     status = json['Status'];
//     versionNo = json['VersionNo'];
//     portalId = json['PortalId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Columns'] = this.columns;
//     data['UserRoleColumns'] = this.userRoleColumns;
//     data['PageType'] = this.pageType;
//     data['UserName'] = this.userName;
//     data['PortalName'] = this.portalName;
//     data['PageName'] = this.pageName;
//     data['Permission'] = this.permission;
//     data['Type'] = this.type;
//     data['Permission1'] = this.permission1;
//     data['Permission2'] = this.permission2;
//     data['Permission3'] = this.permission3;
//     data['Permission4'] = this.permission4;
//     data['Permission5'] = this.permission5;
//     data['Permission6'] = this.permission6;
//     data['Permission7'] = this.permission7;
//     data['Permission8'] = this.permission8;
//     data['Permission9'] = this.permission9;
//     data['Permission10'] = this.permission10;
//     data['Permission11'] = this.permission11;
//     data['Permission12'] = this.permission12;
//     data['Permission13'] = this.permission13;
//     data['Permission14'] = this.permission14;
//     data['Permission15'] = this.permission15;
//     data['Permission16'] = this.permission16;
//     data['Permission17'] = this.permission17;
//     data['Permission18'] = this.permission18;
//     data['Permission19'] = this.permission19;
//     data['Permission20'] = this.permission20;
//     data['Check1'] = this.check1;
//     data['Check2'] = this.check2;
//     data['Check3'] = this.check3;
//     data['Check4'] = this.check4;
//     data['Check5'] = this.check5;
//     data['Check6'] = this.check6;
//     data['Check7'] = this.check7;
//     data['Check8'] = this.check8;
//     data['Check9'] = this.check9;
//     data['Check10'] = this.check10;
//     data['Check11'] = this.check11;
//     data['Check12'] = this.check12;
//     data['Check13'] = this.check13;
//     data['Check14'] = this.check14;
//     data['Check15'] = this.check15;
//     data['Check16'] = this.check16;
//     data['Check17'] = this.check17;
//     data['Check18'] = this.check18;
//     data['Check19'] = this.check19;
//     data['Check20'] = this.check20;
//     data['UserId'] = this.userId;
//     data['User'] = this.user;
//     data['PageId'] = this.pageId;
//     data['Page'] = this.page;
//     data['Permissions'] = this.permissions;
//     data['Id'] = this.id;
//     data['CreatedDate'] = this.createdDate;
//     data['CreatedBy'] = this.createdBy;
//     data['LastUpdatedDate'] = this.lastUpdatedDate;
//     data['LastUpdatedBy'] = this.lastUpdatedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['SequenceOrder'] = this.sequenceOrder;
//     data['CompanyId'] = this.companyId;
//     data['LegalEntityId'] = this.legalEntityId;
//     data['DataAction'] = this.dataAction;
//     data['Status'] = this.status;
//     data['VersionNo'] = this.versionNo;
//     data['PortalId'] = this.portalId;
//     return data;
//   }

//   factory UserPermissionModel.fromMap(Map<String, dynamic> map) {
//     return UserPermissionModel(
//       columns: map['columns'],
//       userRoleColumns: map['userRoleColumns'],
//       pageType: map['pageType'],
//       userName: map['userName'],
//       portalName: map['portalName'],
//       pageName: map['pageName'],
//       permission: map['permission'],
//       type: map['type'],
//       permission1: map['permission1'],
//       permission2: map['permission2'],
//       permission3: map['permission3'],
//       permission4: map['permission4'],
//       permission5: map['permission5'],
//       permission6: map['permission6'],
//       permission7: map['permission7'],
//       permission8: map['permission8'],
//       permission9: map['permission9'],
//       permission10: map['permission10'],
//       permission11: map['permission11'],
//       permission12: map['permission12'],
//       permission13: map['permission13'],
//       permission14: map['permission14'],
//       permission15: map['permission15'],
//       permission16: map['permission16'],
//       permission17: map['permission17'],
//       permission18: map['permission18'],
//       permission19: map['permission19'],
//       permission20: map['permission20'],
//       check1: map['check1'],
//       check2: map['check2'],
//       check3: map['check3'],
//       check4: map['check4'],
//       check5: map['check5'],
//       check6: map['check6'],
//       check7: map['check7'],
//       check8: map['check8'],
//       check9: map['check9'],
//       check10: map['check10'],
//       check11: map['check11'],
//       check12: map['check12'],
//       check13: map['check13'],
//       check14: map['check14'],
//       check15: map['check15'],
//       check16: map['check16'],
//       check17: map['check17'],
//       check18: map['check18'],
//       check19: map['check19'],
//       check20: map['check20'],
//       userId: map['userId'],
//       user: map['user'],
//       pageId: map['pageId'],
//       page: map['page'],
//       permissions: map['permissions'],
//       id: map['id'],
//       createdDate: map['createdDate'],
//       createdBy: map['createdBy'],
//       lastUpdatedDate: map['lastUpdatedDate'],
//       lastUpdatedBy: map['lastUpdatedBy'],
//       isDeleted: map['isDeleted'],
//       sequenceOrder: map['sequenceOrder'],
//       companyId: map['companyId'],
//       legalEntityId: map['legalEntityId'],
//       dataAction: map['dataAction'],
//       status: map['status'],
//       versionNo: map['versionNo'],
//       portalId: map['portalId'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'columns': columns,
//       'userRoleColumns': userRoleColumns,
//       'pageType': pageType,
//       'userName': userName,
//       'portalName': portalName,
//       'pageName': pageName,
//       'permission': permission,
//       'type': type,
//       'permission1': permission1,
//       'permission2': permission2,
//       'permission3': permission3,
//       'permission4': permission4,
//       'permission5': permission5,
//       'permission6': permission6,
//       'permission7': permission7,
//       'permission8': permission8,
//       'permission9': permission9,
//       'permission10': permission10,
//       'permission11': permission11,
//       'permission12': permission12,
//       'permission13': permission13,
//       'permission14': permission14,
//       'permission15': permission15,
//       'permission16': permission16,
//       'permission17': permission17,
//       'permission18': permission18,
//       'permission19': permission19,
//       'permission20': permission20,
//       'check1': check1,
//       'check2': check2,
//       'check3': check3,
//       'check4': check4,
//       'check5': check5,
//       'check6': check6,
//       'check7': check7,
//       'check8': check8,
//       'check9': check9,
//       'check10': check10,
//       'check11': check11,
//       'check12': check12,
//       'check13': check13,
//       'check14': check14,
//       'check15': check15,
//       'check16': check16,
//       'check17': check17,
//       'check18': check18,
//       'check19': check19,
//       'check20': check20,
//       'userId': userId,
//       'user': user,
//       'pageId': pageId,
//       'page': page,
//       'permissions': permissions,
//       'id': id,
//       'createdDate': createdDate,
//       'createdBy': createdBy,
//       'lastUpdatedDate': lastUpdatedDate,
//       'lastUpdatedBy': lastUpdatedBy,
//       'isDeleted': isDeleted,
//       'sequenceOrder': sequenceOrder,
//       'companyId': companyId,
//       'legalEntityId': legalEntityId,
//       'dataAction': dataAction,
//       'status': status,
//       'versionNo': versionNo,
//       'portalId': portalId,
//     };
//   }
// }
