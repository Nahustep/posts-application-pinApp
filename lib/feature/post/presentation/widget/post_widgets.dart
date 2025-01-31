import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/core/entities/post_entity.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../ui/colors.dart';
import '../cubit/post_cubit.dart';
import 'post_item_widget.dart';

class PostWidgets extends StatelessWidget {
  final List<PostEntity> postsList;
  final bool favoriteList;
  const PostWidgets(
      {super.key, required this.postsList, required this.favoriteList});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
        ? (ResponsiveBreakpoints.of(context).smallerThan("DESKTOPSMALL")
            ? 1
            : 3)
        : 4;

    double aspectRatio = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
        ? (ResponsiveBreakpoints.of(context).smallerThan("DESKTOPSMALL")
            ? (ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 1 : 0.6)
            : 0.7)
        : 1;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  favoriteList ? "Mis Posts" : "Posts",
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      context.read<PostCubit>().fetchSavedPosts();
                    },
                    icon: Icon(Icons.sort)),
                InkWell(
                  onTap: () {
                    context.read<PostCubit>().fetchSavedPosts();
                  },
                  child: Text(
                    favoriteList ? "Favoritos" : "Todos",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Divider(
            height: 5,
            thickness: 5,
            color: MaterialColors.dividerColor,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        postsList.isNotEmpty
            ? SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return PostItemWidget(post: postsList[index]);
                    },
                    childCount: postsList.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: aspectRatio,
                  ),
                ))
            : SliverToBoxAdapter(
                child: Center(child: Text("No tienes posts guardados"))),
      ],
    );
  }
}
