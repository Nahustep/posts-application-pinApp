import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_app/feature/post/domain/use_cases/is_saved_post_usecase.dart';
import 'package:post_app/feature/post/domain/use_cases/remove_post_usecase.dart';
import 'package:post_app/feature/post/domain/use_cases/save_post_usecase.dart';
import 'package:post_app/feature/post_by_id/domain/use_cases/get_comments_usecase.dart';

import '../../../../core/entities/post_entity.dart';
import '../../domain/entities/comment_entity.dart';
import '../../domain/use_cases/get_post_by_id_usecase.dart';

part 'post_by_id_state.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  final GetPostDetailUseCase _getPostDetailUseCase;
  final GetCommentsUseCase _getCommentsUseCase;

  final SavePostUseCase _savePostUseCase;
  final IsSavedPostUseCase _isSavedPostUseCase;
  final RemovePostUseCase _removePostUseCase;
  PostDetailCubit(this._getPostDetailUseCase, this._getCommentsUseCase,
      this._savePostUseCase, this._isSavedPostUseCase, this._removePostUseCase)
      : super(InitialState());

  Future<void> fetchPost(String id) async {
    emit(LoadingState());
    final idNumber = int.tryParse(id);
    if (idNumber == null) {
      handleError("Post not found");
    }
    final results = await Future.wait([
      _getPostDetailUseCase.call(params: PostDetailParams(idNumber!)),
      _getCommentsUseCase.call(params: CommentParams(idNumber)),
    ]);

    final postResult = results[0] as Either<DioException, PostEntity>;
    final commentResult =
        results[1] as Either<DioException, List<CommentEntity>>;

    postResult.fold(
      (error) => handleError(error),
      (post) {
        commentResult.fold(
          (error) => handleError(error),
          (comments) {
            emit(SuccessState(post, comments));
          },
        );
      },
    );
  }

  Future<void> togglePostSavedStatus(int postId) async {
    final currentState = state;
    if (currentState is SuccessState) {
      final result =
          await _isSavedPostUseCase.call(params: SavedPostParams(postId));

      result.fold(
        (error) => handleError(error),
        (isSaved) async => await updateSavedPostStatus(
            isSaved, postId, currentState.post, currentState.comments),
      );
    }
  }

  Future<void> updateSavedPostStatus(bool isSaved, int postId, PostEntity post,
      List<CommentEntity> comments) async {
    if (isSaved) {
      await _removePostUseCase.call(params: RemovePostParams(postId));
    } else {
      await _savePostUseCase.call(params: SavePostParams(postId));
    }

    emit(SuccessState(post.copyWith(isSaved: !isSaved), comments));
  }

  void handleError(dynamic error) {
    //TODO:ACA MEJORARIA LA VALIDACION DE ERRORES AGREGANDOLE CODE O ALGUN IDENTIFICADOR PARA MOSTRAR DIFERENTES MENSAJES SEGUN EL CODIGO

    if (error is DioException) {
      emit(ErrorState("Ocurrio un error."));
    } else {
      emit(ErrorState(error.toString()));
    }
  }
}
