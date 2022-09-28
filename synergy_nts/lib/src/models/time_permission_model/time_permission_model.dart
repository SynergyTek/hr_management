class TimePermission {
  TimePermission({
    this.serviceNo,
    this.serviceOwner,
    this.name,
    this.hours,
    this.date,
    this.timePermissionType,
    this.serviceStatus,
    this.userId,
    this.id,
    this.portalId,
    this.pagename,
  });
  String? serviceNo;
  String? serviceOwner;
  String? name;
  String? hours;
  String? date;
  String? timePermissionType;
  String? serviceStatus;
  String? userId;
  String? id;
  String? portalId;
  String? pagename;

  TimePermission.fromJson(Map<String, dynamic> json) {
    serviceNo = json['ServiceNo'];
    serviceOwner = json['ServiceOwner'];
    name = json['Name'];
    hours = json['Hours'];
    date = json['Date'];
    timePermissionType = json['TimePermissionType'];
    serviceStatus = json['ServiceStatus'];
    userId = null;
    id = json['Id'];
    portalId = null;
    pagename = json['pagename'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ServiceNo'] = serviceNo;
    _data['ServiceOwner'] = serviceOwner;
    _data['Name'] = name;
    _data['Hours'] = hours;
    _data['Date'] = date;
    _data['TimePermissionType'] = timePermissionType;
    _data['ServiceStatus'] = serviceStatus;
    _data['UserId'] = userId;
    _data['Id'] = id;
    _data['portalId'] = portalId;
    _data['pagename'] = pagename;
    return _data;
  }
}
