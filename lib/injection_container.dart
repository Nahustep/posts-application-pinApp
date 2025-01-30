import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:post_app/feature/post/domain/repository/posts_repository.dart';
import 'package:post_app/feature/post/domain/use_cases/get_posts_usecase.dart';
import 'package:post_app/feature/post/domain/use_cases/is_saved_post_usecase.dart';
import 'package:post_app/feature/post/domain/use_cases/remove_post_usecase.dart';
import 'package:post_app/feature/post/domain/use_cases/save_post_usecase.dart';
import 'package:post_app/feature/post/presentation/bloc/post_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constants/constants.dart';
import 'feature/post/data/data_sources/local/post_api_services.dart';
import 'feature/post/data/data_sources/post_api_services.dart';
import 'feature/post/data/repository/services_repository_imp.dart';
import 'feature/post/domain/use_cases/get_saved_posts_usecase.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  //external
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: Environments.baseUrl)));
  // Initialize SharedPreferences asynchronously
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // Register SharedPreferences as a singleton
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  //data sources
  getIt.registerSingleton<PostApiServices>(PostApiServices(getIt()));
  getIt.registerSingleton<LocalPostApiServices>(
      LocalPostApiServices(prefs: getIt()));

  // Repositories
  getIt.registerSingleton<PostsRepository>(
      PostsRepositoryImpl(getIt(), getIt()));

  // Usecases
  getIt.registerSingleton<GetPostsUseCase>(GetPostsUseCase(getIt()));
  getIt.registerSingleton<GetSavedPostsUseCase>(GetSavedPostsUseCase(getIt()));

  getIt.registerSingleton<RemovePostUseCase>(RemovePostUseCase(getIt()));
  getIt.registerSingleton<IsSavedPostUseCase>(IsSavedPostUseCase(getIt()));
  getIt.registerSingleton<SavePostUseCase>(SavePostUseCase(getIt()));

  // CUBIT
  getIt.registerFactory<PostCubit>(
      () => PostCubit(getIt(), getIt(), getIt(), getIt(), getIt()));
}
