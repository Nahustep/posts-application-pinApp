import 'package:flutter/material.dart';
import 'package:post_app/feature/post_by_id/domain/entities/comment_entity.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CommentWidget extends StatelessWidget {
  final CommentEntity comment;

  const CommentWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveRowColumn(
                  layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  rowMainAxisAlignment: MainAxisAlignment.start,
                  columnCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveRowColumnItem(
                        child: Text(
                      "${comment.name!} ",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                    ResponsiveRowColumnItem(
                      child: Text(
                        comment.email!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(comment.body!),
                Divider()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
