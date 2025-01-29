import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:post_app/feature/post/domain/repository/posts_repository.dart';
import 'package:post_app/feature/post/domain/use_cases/get_posts_usecase.dart';
import 'package:post_app/feature/post/presentation/bloc/post_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constants/constants.dart';
import 'feature/post/data/data_sources/post_api_services.dart';
import 'feature/post/data/repository/services_repository_imp.dart';

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

  // Repositories
  getIt.registerSingleton<PostsRepository>(
      PostsRepositoryImpl(getIt(), getIt()));

  // Usecases
  getIt.registerSingleton<GetPostsUsecase>(GetPostsUsecase(getIt()));

  // CUBIT
  getIt.registerFactory<PostCubit>(() => PostCubit(getIt()));
}
