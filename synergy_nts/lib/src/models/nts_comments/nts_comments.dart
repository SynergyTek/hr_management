import 'dart:convert';

class Comment {
  String? commentedByUserName;
  String? commentedToUserName;
  String? photoId;
  bool? isAddCommentEnabled;
  String? comment;
  String? commentedDate;
  String? commentToUserId;
  String? commentToUser;
  String? commentedByUserId;
  String? commentedByUser;
  String? ntsTaskId;
  String? ntsServiceId;
  String? ntsNoteId;
  String? ntsTask;
  String? parentCommentId;
  String? parentComment;
  String? id;
  String? createdDate;
  String? createdBy;
  String? lastUpdatedDate;
  String? lastUpdatedBy;
  bool? isDeleted;
  String? sequenceOrder;
  String? companyId;
  String? legalEntityId;
  int? dataAction;
  int? status;
  int? versionNo;
  String? portalId;

  Comment(
      {commentedByUserName,
      commentedToUserName,
      photoId,
      isAddCommentEnabled,
      comment,
      commentedDate,
      commentToUserId,
      commentToUser,
      commentedByUserId,
      commentedByUser,
      ntsTaskId,
      ntsServiceId,
      ntsNoteId,
      ntsTask,
      parentCommentId,
      parentComment,
      id,
      createdDate,
      createdBy,
      lastUpdatedDate,
      lastUpdatedBy,
      isDeleted,
      sequenceOrder,
      companyId,
      legalEntityId,
      dataAction,
      status,
      versionNo,
      portalId});

  Comment.fromJson(Map<String, dynamic> json) {
    commentedByUserName = json['CommentedByUserName'];
    commentedToUserName = json['CommentedToUserName'];
    photoId = json['PhotoId'];
    isAddCommentEnabled = json['IsAddCommentEnabled'];
    comment = json['Comment'];
    commentedDate = json['CommentedDate'];
    commentToUserId = json['CommentToUserId'];
    commentToUser = json['CommentToUser'];
    commentedByUserId = json['CommentedByUserId'];
    commentedByUser = json['CommentedByUser'];
    ntsTaskId = json['NtsTaskId'];
    ntsServiceId = json['NtsServiceId'];
    ntsNoteId = json['NtsNoteId'];
    ntsTask = json['NtsTask'];
    parentCommentId = json['ParentCommentId'];
    parentComment = json['ParentComment'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CommentedByUserName'] = commentedByUserName;
    data['CommentedToUserName'] = commentedToUserName;
    data['PhotoId'] = photoId;
    data['IsAddCommentEnabled'] = isAddCommentEnabled;
    data['Comment'] = comment;
    data['CommentedDate'] = commentedDate;
    data['CommentToUserId'] = commentToUserId;
    data['CommentToUser'] = commentToUser;
    data['CommentedByUserId'] = commentedByUserId;
    data['CommentedByUser'] = commentedByUser;
    data['NtsTaskId'] = ntsTaskId;
    data['NtsServiceId'] = ntsServiceId;
    data['NtsNoteId'] = ntsNoteId;
    data['NtsTask'] = ntsTask;
    data['ParentCommentId'] = parentCommentId;
    data['ParentComment'] = parentComment;
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

class PostComment {
  String? comment;
  String? ntsTaskId;
  String? ntsServiceId;
  String? ntsNoteId;
  String? commentToUserId;
  String? commentedByUserId;
  PostComment({
    comment,
    ntsTaskId,
    ntsServiceId,
    ntsNoteId,
    commentToUserId,
    commentedByUserId,
  });

  Map<String, dynamic> toJson() => {
        "Comment": comment,
        "NtsTaskId": ntsTaskId,
        "NtsServiceId": ntsServiceId,
        "NtsNoteId": ntsNoteId,
        "CommentToUserId": commentToUserId,
        "CommentedByUserId": commentedByUserId,
      };

  factory PostComment.fromMap(Map<String, dynamic> map) {
    return PostComment(
      comment: map['comment'],
      ntsTaskId: map['ntsTaskId'],
      ntsServiceId: map['ntsServiceId'],
      ntsNoteId: map['ntsNoteId'],
      commentToUserId: map['commentToUserId'],
      commentedByUserId: map['commentedByUserId'],
    );
  }

  factory PostComment.fromJson(String source) =>
      PostComment.fromMap(json.decode(source));
}
