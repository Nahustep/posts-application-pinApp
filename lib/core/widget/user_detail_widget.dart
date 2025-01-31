import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class UserDetailWidget extends StatelessWidget {
  final String name;
  final String email;
  final bool isComment;

  const UserDetailWidget(
      {super.key,
      required this.name,
      required this.email,
      required this.isComment});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: isComment ? 20 : 25,
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(width: 20),
        ResponsiveRowColumn(
          layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          rowMainAxisAlignment: MainAxisAlignment.start,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveRowColumnItem(
                child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                "$name ",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
            ResponsiveRowColumnItem(
              child: Text(
                email,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
