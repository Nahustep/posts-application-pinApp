import 'package:flutter/material.dart';
import 'package:post_app/feature/post_by_id/domain/entities/comment_entity.dart';
import 'social_widget.dart';
import '../../../../core/widget/user_detail_widget.dart';

class CommentWidget extends StatelessWidget {
  final CommentEntity comment;

  const CommentWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "31/01/2025",
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        UserDetailWidget(
          email: comment.email!,
          name: comment.name!,
          isComment: true,
        ),
        const SizedBox(height: 10),
        Text(comment.body!),
        const SizedBox(height: 10),
        SocialWidget(),
        const SizedBox(height: 20),
      ],
    );
  }
}
