import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../repository/posts_repository.dart';

class SavePostUseCase implements Usecase<Either<Error, void>, SavePostParams> {
  final PostsRepository repository;

  SavePostUseCase(this.repository);

  @override
  Future<Either<Error, void>> call({SavePostParams? params}) {
    return repository.savePost(postId: params!.postId);
  }
}

class SavePostParams {
  final int postId;
  SavePostParams(this.postId);
}
