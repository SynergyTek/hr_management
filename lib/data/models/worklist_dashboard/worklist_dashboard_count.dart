class WorklistDashboardCount {
  int sRequestedByMe;
  int sRequestOverdue;
  int sRequestCompleted;
  int sRequestDraft;
  int sRequestPending;
  int sRequestCancel;
  int sSharedWithMe;
  int sShareWithPending;
  int sShareWithCompleted;
  int sShareWithOverdue;
  int sShareWithCancel;
  int tRequestedByMe;
  int tRequestOverdue;
  int tRequestCompleted;
  int tRequestDraft;
  int tRequestPending;
  int tAssignedToMe;
  int tAssignPending;
  int tAssignCompleted;
  int tAssignOverdue;
  int tAssignReject;
  int tSharedWithMe;
  int tShareWithPending;
  int tShareWithCompleted;
  int tShareWithOverdue;
  int tShareWithReject;

  WorklistDashboardCount(
      {this.sRequestedByMe,
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
      this.tAssignPending,
      this.tAssignCompleted,
      this.tAssignOverdue,
      this.tAssignReject,
      this.tSharedWithMe,
      this.tShareWithPending,
      this.tShareWithCompleted,
      this.tShareWithOverdue,
      this.tShareWithReject});

  WorklistDashboardCount.fromJson(Map<String, dynamic> json) {
    sRequestedByMe = json['S_RequestedByMe'];
    sRequestOverdue = json['S_RequestOverdue'];
    sRequestCompleted = json['S_RequestCompleted'];
    sRequestDraft = json['S_RequestDraft'];
    sRequestPending = json['S_RequestPending'];
    sRequestCancel = json['S_RequestCancel'];
    sSharedWithMe = json['S_SharedWithMe'];
    sShareWithPending = json['S_ShareWithPending'];
    sShareWithCompleted = json['S_ShareWithCompleted'];
    sShareWithOverdue = json['S_ShareWithOverdue'];
    sShareWithCancel = json['S_ShareWithCancel'];
    tRequestedByMe = json['T_RequestedByMe'];
    tRequestOverdue = json['T_RequestOverdue'];
    tRequestCompleted = json['T_RequestCompleted'];
    tRequestDraft = json['T_RequestDraft'];
    tRequestPending = json['T_RequestPending'];
    tAssignedToMe = json['T_AssignedToMe'];
    tAssignPending = json['T_AssignPending'];
    tAssignCompleted = json['T_AssignCompleted'];
    tAssignOverdue = json['T_AssignOverdue'];
    tAssignReject = json['T_AssignReject'];
    tSharedWithMe = json['T_SharedWithMe'];
    tShareWithPending = json['T_ShareWithPending'];
    tShareWithCompleted = json['T_ShareWithCompleted'];
    tShareWithOverdue = json['T_ShareWithOverdue'];
    tShareWithReject = json['T_ShareWithReject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['S_RequestedByMe'] = this.sRequestedByMe;
    data['S_RequestOverdue'] = this.sRequestOverdue;
    data['S_RequestCompleted'] = this.sRequestCompleted;
    data['S_RequestDraft'] = this.sRequestDraft;
    data['S_RequestPending'] = this.sRequestPending;
    data['S_RequestCancel'] = this.sRequestCancel;
    data['S_SharedWithMe'] = this.sSharedWithMe;
    data['S_ShareWithPending'] = this.sShareWithPending;
    data['S_ShareWithCompleted'] = this.sShareWithCompleted;
    data['S_ShareWithOverdue'] = this.sShareWithOverdue;
    data['S_ShareWithCancel'] = this.sShareWithCancel;
    data['T_RequestedByMe'] = this.tRequestedByMe;
    data['T_RequestOverdue'] = this.tRequestOverdue;
    data['T_RequestCompleted'] = this.tRequestCompleted;
    data['T_RequestDraft'] = this.tRequestDraft;
    data['T_RequestPending'] = this.tRequestPending;
    data['T_AssignedToMe'] = this.tAssignedToMe;
    data['T_AssignPending'] = this.tAssignPending;
    data['T_AssignCompleted'] = this.tAssignCompleted;
    data['T_AssignOverdue'] = this.tAssignOverdue;
    data['T_AssignReject'] = this.tAssignReject;
    data['T_SharedWithMe'] = this.tSharedWithMe;
    data['T_ShareWithPending'] = this.tShareWithPending;
    data['T_ShareWithCompleted'] = this.tShareWithCompleted;
    data['T_ShareWithOverdue'] = this.tShareWithOverdue;
    data['T_ShareWithReject'] = this.tShareWithReject;
    return data;
  }
}

class NoteWorklistDashboardCount {
  int createdByMe;
  int createdByMeExpired;
  int createdByMeActive;
  int createdByMeDraft;
  int sharedByMe;
  int sharedByMeExpired;
  int sharedByMeActive;
  int sharedByMeDraft;
  int shareWithMe;
  int sharedWithMeExpired;
  int sharedWithMeActive;
  int sharedWithMeDraft;

  NoteWorklistDashboardCount(
      {this.createdByMe,
      this.createdByMeExpired,
      this.createdByMeActive,
      this.createdByMeDraft,
      this.sharedByMe,
      this.sharedByMeExpired,
      this.sharedByMeActive,
      this.sharedByMeDraft,
      this.shareWithMe,
      this.sharedWithMeExpired,
      this.sharedWithMeActive,
      this.sharedWithMeDraft});

  NoteWorklistDashboardCount.fromJson(Map<String, dynamic> json) {
    createdByMe = json['createdByMe'];
    createdByMeExpired = json['createdByMeExpired'];
    createdByMeActive = json['createdByMeActive'];
    createdByMeDraft = json['createdByMeDraft'];
    sharedByMe = json['sharedByMe'];
    sharedByMeExpired = json['sharedByMeExpired'];
    sharedByMeActive = json['sharedByMeActive'];
    sharedByMeDraft = json['sharedByMeDraft'];
    shareWithMe = json['shareWithMe'];
    sharedWithMeExpired = json['sharedWithMeExpired'];
    sharedWithMeActive = json['sharedWithMeActive'];
    sharedWithMeDraft = json['sharedWithMeDraft'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdByMe'] = this.createdByMe;
    data['createdByMeExpired'] = this.createdByMeExpired;
    data['createdByMeActive'] = this.createdByMeActive;
    data['createdByMeDraft'] = this.createdByMeDraft;
    data['sharedByMe'] = this.sharedByMe;
    data['sharedByMeExpired'] = this.sharedByMeExpired;
    data['sharedByMeActive'] = this.sharedByMeActive;
    data['sharedByMeDraft'] = this.sharedByMeDraft;
    data['shareWithMe'] = this.shareWithMe;
    data['sharedWithMeExpired'] = this.sharedWithMeExpired;
    data['sharedWithMeActive'] = this.sharedWithMeActive;
    data['sharedWithMeDraft'] = this.sharedWithMeDraft;
    return data;
  }
}