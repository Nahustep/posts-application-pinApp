import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/entities/post_entity.dart';
import '../repository/posts_repository.dart';

class GetPostsUseCase
    implements Usecase<Either<DioException, List<PostEntity>>, void> {
  final PostsRepository _postsRepository;

  GetPostsUseCase(this._postsRepository);

  @override
  Future<Either<DioException, List<PostEntity>>> call({void params}) async {
    return _postsRepository.fetchPosts();
  }
}
