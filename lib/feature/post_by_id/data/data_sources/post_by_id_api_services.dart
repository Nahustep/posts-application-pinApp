import 'package:dio/dio.dart';
import 'package:post_app/core/models/post_model.dart';
import 'package:retrofit/retrofit.dart';

part 'post_by_id_api_services.g.dart';

@RestApi()
sealed class PostDetailApiServices {
  factory PostDetailApiServices(Dio dio) = _PostDetailApiServices;

  @GET('/posts/{id}')
  Future<HttpResponse<PostModel>> getPostById({
    @Path() required int id,
  });
}
