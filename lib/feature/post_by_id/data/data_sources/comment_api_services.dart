import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/comment_model.dart';
part 'comment_api_services.g.dart';

@RestApi()
sealed class CommentApiServices {
  factory CommentApiServices(Dio dio) = _CommentApiServices;

  @GET('/comments')
  Future<List<CommentModel>> getPosts(
      {@Query("postId") required double postId});
}
