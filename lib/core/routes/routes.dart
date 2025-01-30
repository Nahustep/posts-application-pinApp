import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/post/presentation/page/post_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
const home = '/posts';
const postDetail = '/posts/{id}';
final router = GoRouter(
  initialLocation: home, // Ruta inicial
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(path: home, builder: (context, state) => const PostPage()),
  ],
);
