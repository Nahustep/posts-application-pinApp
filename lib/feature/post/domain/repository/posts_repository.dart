import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_app/feature/post/domain/entities/post_entity.dart';

abstract class PostsRepository {
  Future<Either<DioException, List<PostEntity>>> fetchPosts();

  Future<Either<DioException, List<PostEntity>>> fetchFavoritePosts();

  Future<Either<Error, void>> savePost({required int postId});

  Future<Either<Error, void>> removePost({required int postId});

  Future<Either<Error, bool>> isSavedPost({required int postId});
}
