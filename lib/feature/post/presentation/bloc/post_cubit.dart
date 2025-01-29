import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/post_entity.dart';
import '../../domain/use_cases/get_posts_usecase.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetPostsUsecase _getPosts;

  PostCubit(
    GetPostsUsecase getPosts,
  )   : _getPosts = getPosts,
        super(InitialState());

  Future<void> getPosts() async {
    emit(LoadingState());
    final dataState = await _getPosts.call();
    dataState.fold((l) => validateErrors(l), (r) => emit(SuccessState(r)));
  }

  void validateErrors(e) {
    //TODO:ACA MEJORARIA LA VALIDACION DE ERRORES AGREGANDOLE CODE O ALGUN IDENTIFICADOR PARA MOSTRAR DIFERENTES MENSAJES SEGUN EL CODIGO
    if (e is DioException) {
      emit(ErrorState(e.message ?? "Error"));
    } else {
      emit(ErrorState(e.toString()));
    }
  }
}
