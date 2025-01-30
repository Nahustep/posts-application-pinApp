import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:post_app/feature/post/domain/use_cases/is_saved_post_usecase.dart';
import 'package:post_app/feature/post/domain/use_cases/remove_post_usecase.dart';
import 'package:post_app/feature/post/domain/use_cases/save_post_usecase.dart';

import '../../../../core/entities/post_entity.dart';
import '../../domain/use_cases/get_posts_usecase.dart';
import '../../domain/use_cases/get_saved_posts_usecase.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetPostsUseCase _getPostsUseCase;
  final GetSavedPostsUseCase _getSavedPostsUseCase;

  final SavePostUseCase _savePostUseCase;
  final IsSavedPostUseCase _isSavedPostUseCase;
  final RemovePostUseCase _removePostUseCase;

  PostCubit(
    this._getPostsUseCase,
    this._savePostUseCase,
    this._removePostUseCase,
    this._getSavedPostsUseCase,
    this._isSavedPostUseCase,
  ) : super(InitialState());

  Future<void> fetchPosts() async {
    final currentState = state;
    if (currentState is InitialState) {
      emit(LoadingState());
    }
    final result = await _getPostsUseCase.call();

    result.fold(
      (error) => handleError(error),
      (posts) => emit(SuccessState(posts, false)),
    );
  }

  Future<void> fetchSavedPosts() async {
    final currentState = state;
    if (currentState is InitialState) {
      emit(LoadingState());
    }
    final result = await _getSavedPostsUseCase.call();
    if (currentState is SuccessState && currentState.favoriteList) {
      await fetchPosts();
      return;
    }

    result.fold(
      (error) => handleError(error),
      (posts) => emit(SuccessState(posts, true)),
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
            isSaved, postId, currentState.posts, currentState.favoriteList),
      );
    }
  }

  Future<void> updateSavedPostStatus(
      bool isSaved, int postId, List<PostEntity> posts, bool listStatus) async {
    if (isSaved) {
      await _removePostUseCase.call(params: RemovePostParams(postId));
    } else {
      await _savePostUseCase.call(params: SavePostParams(postId));
    }

    final updatedPosts = posts.map((post) {
      if (post.id == postId) {
        return post.copyWith(isSaved: !isSaved);
      }
      return post;
    }).toList();
    if (isSaved && listStatus) {
      updatedPosts.removeWhere((x) => x.id == postId);
    }
    emit(SuccessState(List.from(updatedPosts), listStatus));
  }

  void handleError(dynamic error) {
    //TODO:ACA MEJORARIA LA VALIDACION DE ERRORES AGREGANDOLE CODE O ALGUN IDENTIFICADOR PARA MOSTRAR DIFERENTES MENSAJES SEGUN EL CODIGO

    if (error is DioException) {
      emit(ErrorState(error.message ?? "Ocurrio un error."));
    } else {
      emit(ErrorState(error.toString()));
    }
  }
}
