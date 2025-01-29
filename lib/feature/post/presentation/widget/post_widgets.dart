import 'package:flutter/material.dart';
import 'package:post_app/feature/post/domain/entities/post_entity.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'post_item_widget.dart';

class PostWidgets extends StatelessWidget {
  final List<PostEntity> postsList;

  const PostWidgets({super.key, required this.postsList});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
        ? (ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 1 : 3)
        : 6;

    double aspectRatio = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
        ? (ResponsiveBreakpoints.of(context).smallerThan("DESKTOPSMALL")
            ? (ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 1 : 0.6)
            : 1)
        : 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            "Posts",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: aspectRatio,
            ),
            itemCount: postsList.length,
            itemBuilder: (context, index) {
              return PostItemWidget(post: postsList[index]);
            },
          ),
        ),
      ],
    );
  }
}
