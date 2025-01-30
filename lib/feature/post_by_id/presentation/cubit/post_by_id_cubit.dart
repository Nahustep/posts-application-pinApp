import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_app/feature/post_by_id/domain/use_cases/get_comments_usecase.dart';

import '../../../../core/entities/post_entity.dart';
import '../../domain/entities/comment_entity.dart';
import '../../domain/use_cases/get_post_by_id_usecase.dart';

part 'post_by_id_state.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  final GetPostDetailUseCase _getPostDetailUseCase;
  final GetCommentsUseCase _getCommentsUseCase;

  PostDetailCubit(
    this._getPostDetailUseCase,
    this._getCommentsUseCase,
  ) : super(InitialState());

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

    final postResult = results[0] as Either<Error, PostEntity>;
    final commentResult = results[1] as Either<Error, List<CommentEntity>>;

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

  void handleError(dynamic error) {
    //TODO:ACA MEJORARIA LA VALIDACION DE ERRORES AGREGANDOLE CODE O ALGUN IDENTIFICADOR PARA MOSTRAR DIFERENTES MENSAJES SEGUN EL CODIGO

    if (error is DioException) {
      emit(ErrorState(error.message ?? "Ocurrio un error."));
    } else {
      emit(ErrorState(error.toString()));
    }
  }
}
