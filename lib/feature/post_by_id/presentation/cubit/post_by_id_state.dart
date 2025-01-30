part of 'post_by_id_cubit.dart';

//@immutable
abstract class PostDetailState {}

class InitialState extends PostDetailState {
  InitialState();
}

class LoadingState extends PostDetailState {
  LoadingState();
}

class SuccessState extends PostDetailState {
  final PostEntity post;
  final List<CommentEntity> comments;
  SuccessState(this.post, this.comments);
}

class ErrorState extends PostDetailState {
  final String error;
  ErrorState(this.error);
}
