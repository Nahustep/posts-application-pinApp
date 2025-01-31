import 'package:flutter/material.dart';

class SocialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.favorite_border_outlined,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "1000",
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          width: 25,
        ),
        Icon(Icons.chat_bubble_outline, color: Colors.grey),
        const SizedBox(
          width: 10,
        ),
        Text(
          "1110",
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
