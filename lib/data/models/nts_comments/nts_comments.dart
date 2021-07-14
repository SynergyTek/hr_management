import 'dart:convert';

class Comment{}




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

  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
      'ntsTaskId': ntsTaskId,
      'commentToUserId': commentToUserId,
      'commentedByUserId': commentedByUserId,
    };
  }

  factory PostComment.fromMap(Map<String, dynamic> map) {
    return PostComment(
      comment: map['comment'],
      ntsTaskId: map['ntsTaskId'],
      commentToUserId: map['commentToUserId'],
      commentedByUserId: map['commentedByUserId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostComment.fromJson(String source) => PostComment.fromMap(json.decode(source));
}
