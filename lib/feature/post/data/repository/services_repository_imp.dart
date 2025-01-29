import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_app/feature/post/data/data_sources/post_api_services.dart';

import '../../domain/entities/post_entity.dart';
import '../../domain/repository/posts_repository.dart';
import '../data_sources/local/post_api_services.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostApiServices postApiServices;
  final LocalPostApiServices localPostApiServices;

  PostsRepositoryImpl(this.postApiServices, this.localPostApiServices);

  @override
  Future<Either<DioException, List<PostEntity>>> getPosts() async {
    try {
      final httpResponse = await postApiServices.getPosts();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return right(httpResponse.data);
      } else {
        return left(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<DioException, List<PostEntity>>> getFavoritePosts() async {
    try {
      final httpResponse = await postApiServices.getPosts();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final favoritePosts = localPostApiServices.getfavoritePosts();
        final posts = httpResponse.data
            .where((x) => favoritePosts.contains(x.id))
            .toList();
        return right(posts);
      } else {
        return left(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return left(e);
    }
  }
}
