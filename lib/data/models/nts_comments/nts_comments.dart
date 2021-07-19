import 'dart:convert';

class Comment {
  String commentedByUserName;
  String commentedToUserName;
  String photoId;
  bool isAddCommentEnabled;
  String comment;
  String commentedDate;
  String commentToUserId;
  String commentToUser;
  String commentedByUserId;
  String commentedByUser;
  String ntsTaskId;
  String ntsServiceId;
  String ntsNoteId;
  String ntsTask;
  String parentCommentId;
  String parentComment;
  String id;
  String createdDate;
  String createdBy;
  String lastUpdatedDate;
  String lastUpdatedBy;
  bool isDeleted;
  String sequenceOrder;
  String companyId;
  String legalEntityId;
  int dataAction;
  int status;
  int versionNo;
  String portalId;

  Comment(
      {this.commentedByUserName,
      this.commentedToUserName,
      this.photoId,
      this.isAddCommentEnabled,
      this.comment,
      this.commentedDate,
      this.commentToUserId,
      this.commentToUser,
      this.commentedByUserId,
      this.commentedByUser,
      this.ntsTaskId,
      this.ntsServiceId,
      this.ntsNoteId,
      this.ntsTask,
      this.parentCommentId,
      this.parentComment,
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CommentedByUserName'] = this.commentedByUserName;
    data['CommentedToUserName'] = this.commentedToUserName;
    data['PhotoId'] = this.photoId;
    data['IsAddCommentEnabled'] = this.isAddCommentEnabled;
    data['Comment'] = this.comment;
    data['CommentedDate'] = this.commentedDate;
    data['CommentToUserId'] = this.commentToUserId;
    data['CommentToUser'] = this.commentToUser;
    data['CommentedByUserId'] = this.commentedByUserId;
    data['CommentedByUser'] = this.commentedByUser;
    data['NtsTaskId'] = this.ntsTaskId;
    data['NtsServiceId'] = this.ntsServiceId;
    data['NtsNoteId'] = this.ntsNoteId;
    data['NtsTask'] = this.ntsTask;
    data['ParentCommentId'] = this.parentCommentId;
    data['ParentComment'] = this.parentComment;
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

class PostComment {
  String comment;
  String ntsTaskId;
  String ntsServiceId;
  String ntsNoteId;
  String commentToUserId;
  String commentedByUserId;
  PostComment({
    this.comment,
    this.ntsTaskId,
    this.ntsServiceId,
    this.ntsNoteId,
    this.commentToUserId,
    this.commentedByUserId,
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
