import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../repository/posts_repository.dart';

class RemovePostUseCase
    implements Usecase<Either<Error, void>, RemovePostParams> {
  final PostsRepository repository;

  RemovePostUseCase(this.repository);

  @override
  Future<Either<Error, void>> call({RemovePostParams? params}) {
    return repository.removePost(postId: params!.postId);
  }
}

class RemovePostParams {
  final int postId;
  RemovePostParams(this.postId);
}
