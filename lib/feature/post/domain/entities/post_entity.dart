import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  const PostEntity({this.title, this.body, this.id, this.saved});
  final String? title;
  final String? body;
  final int? id;
  final bool? saved;

  @override
  List<Object?> get props => [title, body, id, saved];
}
