import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../repository/post_by_id_repository.dart';

class RemovePostUseCase
    implements Usecase<Either<Error, void>, RemovePostParams> {
  final PostDetailRepository repository;

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
