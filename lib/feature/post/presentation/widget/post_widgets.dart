import 'package:flutter/material.dart';

import 'post_item_widget.dart';

class PostWidgets extends StatelessWidget {
  const PostWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [PostItemWidget(), PostItemWidget(), PostItemWidget()],
    );
  }
}
