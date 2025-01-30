import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/models/post_model.dart';
part 'post_api_services.g.dart';

@RestApi()
sealed class PostApiServices {
  factory PostApiServices(Dio dio) = _PostApiServices;

  @GET('/posts')
  Future<HttpResponse<List<PostModel>>> getPosts();
}
