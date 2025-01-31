import 'package:flutter/material.dart';
import 'package:post_app/feature/post_by_id/domain/entities/comment_entity.dart';

class CommentWidget extends StatelessWidget {
  final CommentEntity comment;

  const CommentWidget({super.key, required this.comment});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(comment.name!),
        Text(comment.email!),
        Text(comment.body!),
      ],
    );
  }
}
