import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/comment_entity.dart';
import '../repository/post_by_id_repository.dart';

class GetCommentsUseCase
    implements
        Usecase<Either<DioException, List<CommentEntity>>, PostDetailParams> {
  final PostDetailRepository repository;

  GetCommentsUseCase(this.repository);

  @override
  Future<Either<DioException, List<CommentEntity>>> call(
      {PostDetailParams? params}) {
    return repository.fetchCommentsByPostId(postId: params!.postId);
  }
}

class PostDetailParams {
  final int postId;
  PostDetailParams(this.postId);
}
