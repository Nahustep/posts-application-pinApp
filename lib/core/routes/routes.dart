import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/post/presentation/page/post_page.dart';
import '../../feature/post_by_id/presentation/page/post_by_id_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
const home = '/posts';
const postDetail = '/posts/:id';
final router = GoRouter(
  initialLocation: home, // Ruta inicial
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(path: home, builder: (context, state) => const PostPage()),
    GoRoute(
      path: postDetail,
      builder: (context, state) {
        final postId = state.pathParameters['id']!;
        return PostDetailPage(id: postId);
      },
    ),
  ],
);
