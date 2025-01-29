import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/constants/constants.dart';
import 'feature/post/data/data_sources/post_api_services.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Firebase

  //Dio
  final dio = getIt
      .registerSingleton<Dio>(Dio(BaseOptions(baseUrl: Environments.baseUrl)));

  //data sources
  getIt.registerSingleton<PostApiServices>(PostApiServices(getIt()));
}
