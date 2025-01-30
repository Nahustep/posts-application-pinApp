import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  const PostEntity({this.title, this.body, this.id, this.isSaved = false});
  final String? title;
  final String? body;
  final int? id;
  final bool isSaved;

  @override
  List<Object?> get props => [title, body, id, isSaved];
  PostEntity copyWith({int? id, String? title, String? body, bool? isSaved}) {
    return PostEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
