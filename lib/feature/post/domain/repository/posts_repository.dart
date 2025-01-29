import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_app/feature/post/domain/entities/post_entity.dart';

abstract class PostsRepository {
  Future<Either<DioException, List<PostEntity>>> getPosts();
  Future<Either<DioException, List<PostEntity>>> getFavoritePosts();
}
