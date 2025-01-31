import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/core/entities/post_entity.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    context.read<PostCubit>().togglePostSavedStatus(post.id!);
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
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                child: const Text("Leer más"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
