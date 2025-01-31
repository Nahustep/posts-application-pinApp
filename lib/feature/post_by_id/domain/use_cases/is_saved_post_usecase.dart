import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../repository/post_by_id_repository.dart';

class IsSavedPostUseCase
    implements Usecase<Either<Error, bool>, SavedPostParams> {
  final PostDetailRepository repository;

  IsSavedPostUseCase(this.repository);

  @override
  Future<Either<Error, bool>> call({SavedPostParams? params}) {
    return repository.isSavedPost(postId: params!.postId);
  }
}

class SavedPostParams {
  final int postId;
  SavedPostParams(this.postId);
}
