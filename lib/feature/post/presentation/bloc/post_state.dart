part of 'post_cubit.dart';

//@immutable
abstract class PostState {}

class InitialState extends PostState {
  InitialState();
}

class LoadingState extends PostState {
  LoadingState();
}

class SuccessState extends PostState {
  final List<PostEntity> posts;
  final bool favoriteList;
  SuccessState(this.posts, this.favoriteList);
}

class ErrorState extends PostState {
  final String error;
  ErrorState(this.error);
}
