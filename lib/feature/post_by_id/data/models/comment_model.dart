import '../../domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  const CommentModel(
      {super.body, super.id, super.postId, super.email, super.name});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      body: json['body'] as String?,
      postId: json['postId'] as int?,
      id: json['id'] as int?,
      email: json['email'] as String?,
      name: json['name'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'body': body,
      'id': id,
      'postId': postId,
      'email': email,
      'name': name
    };
  }
}
