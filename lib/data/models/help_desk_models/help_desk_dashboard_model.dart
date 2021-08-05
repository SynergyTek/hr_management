import 'dart:convert';

HelpDeskDashboardModel helpDeskDashboardModelFromJson(String str) =>
    HelpDeskDashboardModel.fromJson(json.decode(str));

String helpDeskDashboardModelToJson(HelpDeskDashboardModel data) =>
    json.encode(data.toJson());

class HelpDeskDashboardModel {
  HelpDeskDashboardModel({
    this.openRequestCount,
    this.slaViolated,
    this.serviceApproachingViolationInaMin,
    this.serviceApproachingViolation,
  });

  int openRequestCount;
  int slaViolated;
  int serviceApproachingViolationInaMin;
  int serviceApproachingViolation;

  factory HelpDeskDashboardModel.fromJson(Map<String, dynamic> json) =>
      HelpDeskDashboardModel(
        openRequestCount: json["OpenRequestCount"],
        slaViolated: json["SLAViolated"],
        serviceApproachingViolationInaMin:
            json["ServiceApproachingViolationInaMin"],
        serviceApproachingViolation: json["ServiceApproachingViolation"],
      );

  Map<String, dynamic> toJson() => {
        "OpenRequestCount": openRequestCount,
        "SLAViolated": slaViolated,
        "ServiceApproachingViolationInaMin": serviceApproachingViolationInaMin,
        "ServiceApproachingViolation": serviceApproachingViolation,
      };
}
