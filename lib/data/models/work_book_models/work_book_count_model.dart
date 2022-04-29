// To parse this JSON data, do
//
//     final workBookCountModel = workBookCountModelFromJson(jsonString);

import 'dart:convert';

WorkBookCountModel workBookCountModelFromJson(String str) =>
    WorkBookCountModel.fromJson(json.decode(str));

String workBookCountModelToJson(WorkBookCountModel data) =>
    json.encode(data.toJson());

class WorkBookCountModel {
  WorkBookCountModel({
    this.sRequestedByMe,
    this.sRequestOverdue,
    this.sRequestCompleted,
    this.sRequestDraft,
    this.sRequestPending,
    this.sRequestCancel,
    this.sSharedWithMe,
    this.sShareWithPending,
    this.sShareWithCompleted,
    this.sShareWithOverdue,
    this.sShareWithCancel,
    this.tRequestedByMe,
    this.tRequestOverdue,
    this.tRequestCompleted,
    this.tRequestDraft,
    this.tRequestPending,
    this.tAssignedToMe,
    this.tAssignPlanned,
    this.tAssignPlannedOverdue,
    this.tAssignPending,
    this.tAssignPendingOverdue,
    this.tAssignCompleted,
    this.tAssignOverdue,
    this.tAssignReject,
    this.tAssignCancel,
    this.tAssignAll,
    this.tSharedWithMe,
    this.tShareWithPending,
    this.tShareWithCompleted,
    this.tShareWithOverdue,
    this.tShareWithReject,
    this.nCreatedByMe,
    this.nCreatedByMeExpired,
    this.nCreatedByMeActive,
    this.nCreatedByMeDraft,
    this.nCreatedByMeAll,
    this.nCreatedByMeOverdue,
    this.nCreatedByMeCompleted,
    this.readCount,
    this.uUnReadCount,
    this.archivedCount,
    this.allCount,
    this.psCreatedByMe,
    this.psCreatedByMeExpired,
    this.psCreatedByMeActive,
    this.psCreatedByMeDraft,
    this.psCreatedByMeAll,
    this.psCreatedByMeOverdue,
    this.psCreatedByMeCompleted,
  });

  String? sRequestedByMe;
  String? sRequestOverdue;
  String? sRequestCompleted;
  String? sRequestDraft;
  String? sRequestPending;
  String? sRequestCancel;
  String? sSharedWithMe;
  String? sShareWithPending;
  String? sShareWithCompleted;
  String? sShareWithOverdue;
  String? sShareWithCancel;
  String? tRequestedByMe;
  String? tRequestOverdue;
  String? tRequestCompleted;
  String? tRequestDraft;
  String? tRequestPending;
  String? tAssignedToMe;
  String? tAssignPlanned;
  String? tAssignPlannedOverdue;
  String? tAssignPending;
  String? tAssignPendingOverdue;
  String? tAssignCompleted;
  String? tAssignOverdue;
  String? tAssignReject;
  String? tAssignCancel;
  String? tAssignAll;
  String? tSharedWithMe;
  String? tShareWithPending;
  String? tShareWithCompleted;
  String? tShareWithOverdue;
  String? tShareWithReject;
  String? nCreatedByMe;
  String? nCreatedByMeExpired;
  String? nCreatedByMeActive;
  String? nCreatedByMeDraft;
  String? nCreatedByMeAll;
  String? nCreatedByMeOverdue;
  String? nCreatedByMeCompleted;
  String? readCount;
  String? uUnReadCount;
  String? archivedCount;
  String? allCount;
  String? psCreatedByMe;
  String? psCreatedByMeExpired;
  String? psCreatedByMeActive;
  String? psCreatedByMeDraft;
  String? psCreatedByMeAll;
  String? psCreatedByMeOverdue;
  String? psCreatedByMeCompleted;

  factory WorkBookCountModel.fromJson(Map<String, dynamic> json) =>
      WorkBookCountModel(
        sRequestedByMe: json["S_RequestedByMe"],
        sRequestOverdue: json["S_RequestOverdue"],
        sRequestCompleted: json["S_RequestCompleted"],
        sRequestDraft: json["S_RequestDraft"],
        sRequestPending: json["S_RequestPending"],
        sRequestCancel: json["S_RequestCancel"],
        sSharedWithMe: json["S_SharedWithMe"],
        sShareWithPending: json["S_ShareWithPending"],
        sShareWithCompleted: json["S_ShareWithCompleted"],
        sShareWithOverdue: json["S_ShareWithOverdue"],
        sShareWithCancel: json["S_ShareWithCancel"],
        tRequestedByMe: json["T_RequestedByMe"],
        tRequestOverdue: json["T_RequestOverdue"],
        tRequestCompleted: json["T_RequestCompleted"],
        tRequestDraft: json["T_RequestDraft"],
        tRequestPending: json["T_RequestPending"],
        tAssignedToMe: json["T_AssignedToMe"],
        tAssignPlanned: json["T_AssignPlanned"],
        tAssignPlannedOverdue: json["T_AssignPlannedOverdue"],
        tAssignPending: json["T_AssignPending"],
        tAssignPendingOverdue: json["T_AssignPendingOverdue"],
        tAssignCompleted: json["T_AssignCompleted"],
        tAssignOverdue: json["T_AssignOverdue"],
        tAssignReject: json["T_AssignReject"],
        tAssignCancel: json["T_AssignCancel"],
        tAssignAll: json["T_AssignAll"],
        tSharedWithMe: json["T_SharedWithMe"],
        tShareWithPending: json["T_ShareWithPending"],
        tShareWithCompleted: json["T_ShareWithCompleted"],
        tShareWithOverdue: json["T_ShareWithOverdue"],
        tShareWithReject: json["T_ShareWithReject"],
        nCreatedByMe: json["N_CreatedByMe"],
        nCreatedByMeExpired: json["N_CreatedByMeExpired"],
        nCreatedByMeActive: json["N_CreatedByMeActive"],
        nCreatedByMeDraft: json["N_CreatedByMeDraft"],
        nCreatedByMeAll: json["N_CreatedByMeAll"],
        nCreatedByMeOverdue: json["N_CreatedByMeOverdue"],
        nCreatedByMeCompleted: json["N_CreatedByMeCompleted"],
        readCount: json["ReadCount"],
        uUnReadCount: json["UnReadCount"],
        archivedCount: json["ArchivedCount"],
        allCount: json["AllCount"],
        psCreatedByMe: json["PS_CreatedByMe"],
        psCreatedByMeExpired: json["PS_CreatedByMeExpired"],
        psCreatedByMeActive: json["PS_CreatedByMeActive"],
        psCreatedByMeDraft: json["PS_CreatedByMeDraft"],
        psCreatedByMeAll: json["PS_CreatedByMeAll"],
        psCreatedByMeOverdue: json["PS_CreatedByMeOverdue"],
        psCreatedByMeCompleted: json["PS_CreatedByMeCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "S_RequestedByMe": sRequestedByMe,
        "S_RequestOverdue": sRequestOverdue,
        "S_RequestCompleted": sRequestCompleted,
        "S_RequestDraft": sRequestDraft,
        "S_RequestPending": sRequestPending,
        "S_RequestCancel": sRequestCancel,
        "S_SharedWithMe": sSharedWithMe,
        "S_ShareWithPending": sShareWithPending,
        "S_ShareWithCompleted": sShareWithCompleted,
        "S_ShareWithOverdue": sShareWithOverdue,
        "S_ShareWithCancel": sShareWithCancel,
        "T_RequestedByMe": tRequestedByMe,
        "T_RequestOverdue": tRequestOverdue,
        "T_RequestCompleted": tRequestCompleted,
        "T_RequestDraft": tRequestDraft,
        "T_RequestPending": tRequestPending,
        "T_AssignedToMe": tAssignedToMe,
        "T_AssignPlanned": tAssignPlanned,
        "T_AssignPlannedOverdue": tAssignPlannedOverdue,
        "T_AssignPending": tAssignPending,
        "T_AssignPendingOverdue": tAssignPendingOverdue,
        "T_AssignCompleted": tAssignCompleted,
        "T_AssignOverdue": tAssignOverdue,
        "T_AssignReject": tAssignReject,
        "T_AssignCancel": tAssignCancel,
        "T_AssignAll": tAssignAll,
        "T_SharedWithMe": tSharedWithMe,
        "T_ShareWithPending": tShareWithPending,
        "T_ShareWithCompleted": tShareWithCompleted,
        "T_ShareWithOverdue": tShareWithOverdue,
        "T_ShareWithReject": tShareWithReject,
        "N_CreatedByMe": nCreatedByMe,
        "N_CreatedByMeExpired": nCreatedByMeExpired,
        "N_CreatedByMeActive": nCreatedByMeActive,
        "N_CreatedByMeDraft": nCreatedByMeDraft,
        "N_CreatedByMeAll": nCreatedByMeAll,
        "N_CreatedByMeOverdue": nCreatedByMeOverdue,
        "N_CreatedByMeCompleted": nCreatedByMeCompleted,
        "ReadCount": readCount,
        "UnReadCount": uUnReadCount,
        "ArchivedCount": archivedCount,
        "AllCount": allCount,
        "PS_CreatedByMe": psCreatedByMe,
        "PS_CreatedByMeExpired": psCreatedByMeExpired,
        "PS_CreatedByMeActive": psCreatedByMeActive,
        "PS_CreatedByMeDraft": psCreatedByMeDraft,
        "PS_CreatedByMeAll": psCreatedByMeAll,
        "PS_CreatedByMeOverdue": psCreatedByMeOverdue,
        "PS_CreatedByMeCompleted": psCreatedByMeCompleted,
      };
}

/*
{
    "S_RequestedByMe": 0,
    "S_RequestOverdue": 0,
    "S_RequestCompleted": 0,
    "S_RequestDraft": 0,
    "S_RequestPending": 0,
    "S_RequestCancel": 0,
    "S_SharedWithMe": 0,
    "S_ShareWithPending": 0,
    "S_ShareWithCompleted": 0,
    "S_ShareWithOverdue": 0,
    "S_ShareWithCancel": 0,
    "T_RequestedByMe": 0,
    "T_RequestOverdue": 0,
    "T_RequestCompleted": 0,
    "T_RequestDraft": 0,
    "T_RequestPending": 0,
    "T_AssignedToMe": 0,
    "T_AssignPlanned": 0,
    "T_AssignPlannedOverdue": 0,
    "T_AssignPending": 0,
    "T_AssignPendingOverdue": 0,
    "T_AssignCompleted": 0,
    "T_AssignOverdue": 0,
    "T_AssignReject": 0,
    "T_AssignCancel": 0,
    "T_AssignAll": 0,
    "T_SharedWithMe": 0,
    "T_ShareWithPending": 0,
    "T_ShareWithCompleted": 0,
    "T_ShareWithOverdue": 0,
    "T_ShareWithReject": 0,
    "N_CreatedByMe": 0,
    "N_CreatedByMeExpired": 0,
    "N_CreatedByMeActive": 1,
    "N_CreatedByMeDraft": 0,
    "N_CreatedByMeAll": 0,
    "N_CreatedByMeOverdue": 0,
    "N_CreatedByMeCompleted": 0,
    "ReadCount": 0,
    "UnReadCount": 0,
    "ArchivedCount": 0,
    "AllCount": 0,
    "PS_CreatedByMe": 0,
    "PS_CreatedByMeExpired": 0,
    "PS_CreatedByMeActive": 0,
    "PS_CreatedByMeDraft": 0,
    "PS_CreatedByMeAll": 0,
    "PS_CreatedByMeOverdue": 0,
    "PS_CreatedByMeCompleted": 0
}
*/