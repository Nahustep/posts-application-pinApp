import 'package:flutter/material.dart';

import '../widget/post_widgets.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const PostWidgets());
  }
}
