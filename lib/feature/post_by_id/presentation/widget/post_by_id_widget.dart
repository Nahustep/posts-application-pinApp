import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:post_app/core/entities/post_entity.dart';
import 'package:post_app/ui/colors.dart';

import '../../domain/entities/comment_entity.dart';
import '../cubit/post_by_id_cubit.dart';
import 'comment_widget.dart';
import 'social_widget.dart';
import '../../../../core/widget/user_detail_widget.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          context.go('/posts');
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                        )),
                    InkWell(
                      onTap: () {
                        context.go('/posts');
                      },
                      child: Text(
                        "Atras",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          context
                              .read<PostDetailCubit>()
                              .togglePostSavedStatus(post.id!);
                        },
                        icon: Icon(
                          post.isSaved
                              ? Icons.bookmark
                              : Icons.bookmark_outline,
                          color:
                              post.isSaved ? Colors.amberAccent : Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.share,
                      color: Colors.grey,
                      size: 25,
                    )
                  ],
                )),
            Divider(
              height: 3,
              thickness: 3,
              color: MaterialColors.dividerColor,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "31/01/2025",
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: UserDetailWidget(
                email: "jhondoe@jhondoe.com",
                name: "john doe",
                isComment: false,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                post.title ?? "",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                //solo para hacer el body mas largo
                " ${post.body!} ${post.body!}",
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SocialWidget(),
            ),
            const SizedBox(height: 15),
            Divider(
              height: 20,
              thickness: 20,
              color: MaterialColors.dividerColor,
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    "Likes",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                  Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'Comments',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Positioned(
                        bottom: -1,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 2,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 5),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: comments
                    .map((x) => CommentWidget(
                          comment: x,
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
