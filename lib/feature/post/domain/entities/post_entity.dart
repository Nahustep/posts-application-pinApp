import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  const PostEntity({this.title, this.body, this.id});
  final String? title;
  final String? body;
  final String? id;

  @override
  List<Object?> get props => [title, body, id];
}
