import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_app/feature/post/data/data_sources/post_api_services.dart';
import '../../../../core/entities/post_entity.dart';
import '../../domain/repository/posts_repository.dart';
import '../../../../core/data_sources/local/post_api_services.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostApiServices postApiServices;
  final LocalPostApiServices localPostApiServices;

  PostsRepositoryImpl(this.postApiServices, this.localPostApiServices);

  @override
  Future<Either<DioException, List<PostEntity>>> fetchPosts() async {
    try {
      final httpResponse = await postApiServices.getPosts();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final posts = httpResponse.data.map<PostEntity>((post) {
          final isSaved = localPostApiServices.isPostSaved(post.id!);
          return post.copyWith(isSaved: isSaved);
        }).toList();
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

  @override
  Future<Either<DioException, List<PostEntity>>> fetchFavoritePosts() async {
    try {
      final httpResponse = await postApiServices.getPosts();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final favoritePostIds = localPostApiServices.getfavoritePosts();
        final posts = httpResponse.data
            .where((post) => favoritePostIds.contains(post.id))
            .map<PostEntity>((post) {
          return post.copyWith(isSaved: true);
        }).toList();
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

  @override
  Future<Either<Error, void>> savePost({required int postId}) async {
    try {
      await localPostApiServices.savePost(postId);
      return Right(null);
    } catch (e) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, void>> removePost({required int postId}) async {
    try {
      await localPostApiServices.removePost(postId);
      return Right(null);
    } catch (e) {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, bool>> isSavedPost({required int postId}) async {
    try {
      final isSaved = localPostApiServices.isPostSaved(postId);
      return Right(isSaved);
    } catch (e) {
      return Left(Error());
    }
  }
}
