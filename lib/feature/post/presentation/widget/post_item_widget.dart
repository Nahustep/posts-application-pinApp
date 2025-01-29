import 'package:flutter/material.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Text("Esto es un titulo"), Text("Esto es una descripcion")],
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
