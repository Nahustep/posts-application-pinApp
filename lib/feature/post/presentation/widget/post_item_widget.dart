import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:post_app/core/entities/post_entity.dart';

import '../../../../core/widget/user_detail_widget.dart';
import '../cubit/post_cubit.dart';

class PostItemWidget extends StatelessWidget {
  final PostEntity post;

  const PostItemWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          context.go("/posts/${post.id}");
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<PostCubit>().togglePostSavedStatus(post.id!);
                    },
                    icon: Icon(
                      post.isSaved ? Icons.bookmark : Icons.bookmark_outline,
                      color: post.isSaved ? Colors.amberAccent : Colors.grey,
                      size: 30,
                    ),
                  ),
                  Icon(
                    Icons.share,
                    color: Colors.grey,
                    size: 25,
                  ),
                ],
              ),
              UserDetailWidget(
                name: "jhon doe",
                email: "jhondoe@email.com",
                isComment: true,
              ),
              const SizedBox(height: 20),
              Text(
                post.title ?? "",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                "${post.body}${post.body}",
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
