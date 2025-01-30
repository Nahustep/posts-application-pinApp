import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_app/feature/post/data/data_sources/post_api_services.dart';
import 'package:post_app/feature/post_by_id/domain/entities/comment_entity.dart';
import '../../../../core/data_sources/local/post_api_services.dart';
import '../../../../core/entities/post_entity.dart';
import '../../domain/repository/post_by_id_repository.dart';
import '../data_sources/comment_api_services.dart';
import '../data_sources/post_by_id_api_services.dart';

class PostDetailRepositoryImpl implements PostDetailRepository {
  final CommentApiServices commentApiServices;
  final PostDetailApiServices postDetailApiServices;

  final LocalPostApiServices localPostApiServices;

  PostDetailRepositoryImpl(this.commentApiServices, this.postDetailApiServices,
      this.localPostApiServices);

  @override
  Future<Either<DioException, List<CommentEntity>>> fetchCommentsByPostId(
      {required int postId}) {
    // TODO: implement fetchCommentsByPostId
    throw UnimplementedError();
  }

  @override
  Future<Either<DioException, PostEntity>> fetchPostById(
      {required int postId}) async {
    try {
      final httpResponse = await postDetailApiServices.getPostById(id: postId);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        PostEntity postResponse = httpResponse.data;
        final isSaved = localPostApiServices.isPostSaved(httpResponse.data.id!);
        if (isSaved) {
          postResponse = httpResponse.data.copyWith(isSaved: isSaved);
        }
        return right(postResponse);
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
