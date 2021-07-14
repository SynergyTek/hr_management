import 'dart:convert';

class Comment {}

class PostComment {
  String comment;
  String ntsTaskId;
  String commentToUserId;
  String commentedByUserId;
  PostComment({
    this.comment,
    this.ntsTaskId,
    this.commentToUserId,
    this.commentedByUserId,
  });

  Map<String, dynamic> toJson() => {
        "Comment": comment,
        "NtsTaskId": ntsTaskId,
        "CommentToUserId": commentToUserId,
        "CommentedByUserId": commentedByUserId,
      };

  factory PostComment.fromMap(Map<String, dynamic> map) {
    return PostComment(
      comment: map['comment'],
      ntsTaskId: map['ntsTaskId'],
      commentToUserId: map['commentToUserId'],
      commentedByUserId: map['commentedByUserId'],
    );
  }

  factory PostComment.fromJson(String source) =>
      PostComment.fromMap(json.decode(source));
}
