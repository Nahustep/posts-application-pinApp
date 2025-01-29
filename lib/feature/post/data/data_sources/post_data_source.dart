import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/post_model.dart';
part 'post_data_source.g.dart';

@RestApi()
sealed class PostApiServices {
  factory PostApiServices(Dio dio) = _PostApiServices;

  @GET('/posts')
  Future<List<PostModel>> getPosts();
}
