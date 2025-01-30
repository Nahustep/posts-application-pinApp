import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/entities/post_entity.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/post_by_id_repository.dart';

class GetPostDetailUseCase
    implements Usecase<Either<DioException, PostEntity>, PostDetailParams> {
  final PostDetailRepository repository;

  GetPostDetailUseCase(this.repository);

  @override
  Future<Either<DioException, PostEntity>> call({PostDetailParams? params}) {
    return repository.fetchPostById(postId: params!.postId);
  }
}

class PostDetailParams {
  final int postId;
  PostDetailParams(this.postId);
}
