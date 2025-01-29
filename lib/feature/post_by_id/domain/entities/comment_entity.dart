import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  const CommentEntity({this.postId, this.body, this.id, this.name, this.email});
  final int? postId;
  final String? email;
  final int? id;
  final String? name;
  final String? body;

  @override
  List<Object?> get props => [postId, email, id, name, body];
}
