import 'package:flutter/material.dart';
import 'package:post_app/core/entities/post_entity.dart';
import 'package:post_app/feature/post_by_id/domain/entities/comment_entity.dart';

import 'comment_widget.dart';

class PostDetailWidget extends StatelessWidget {
  final PostEntity post;
  final List<CommentEntity> comments;

  const PostDetailWidget(
      {super.key, required this.post, required this.comments});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    //context.read<PostCubit>().togglePostSavedStatus(post.id!);
                  },
                  icon: Icon(
                    post.isSaved ? Icons.star : Icons.star_outline,
                    color: post.isSaved ? Colors.amber : Colors.grey,
                  )),
            ),
            Text(
              post.title ?? "",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              post.body ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 15),
            Text(
              "Comments",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 15),
            Column(
              children: comments
                  .map((x) => CommentWidget(
                        comment: x,
                      ))
                  .toList(),
            )
          ]),
        ),
      ),
    );
  }
}
