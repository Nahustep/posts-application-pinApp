import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/comment_model.dart';
part 'post_by_id_data_source.g.dart';

@RestApi()
sealed class PostDetailApiServices {
  factory PostDetailApiServices(Dio dio) = _PostDetailApiServices;

  @GET('/posts/{id}')
  Future<CommentModel> getPostById({
    @Path() required String id,
  });
}
