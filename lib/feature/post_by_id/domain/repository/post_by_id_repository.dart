import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_app/core/entities/post_entity.dart';
import 'package:post_app/feature/post_by_id/domain/entities/comment_entity.dart';

abstract class PostDetailRepository {
  Future<Either<DioException, PostEntity>> fetchPostById({required int postId});

  Future<Either<DioException, List<CommentEntity>>> fetchCommentsByPostId(
      {required int postId});
}
