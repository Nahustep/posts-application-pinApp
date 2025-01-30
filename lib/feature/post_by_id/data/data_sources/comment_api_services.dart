import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/comment_model.dart';
part 'comment_api_services.g.dart';

@RestApi()
sealed class CommentApiServices {
  factory CommentApiServices(Dio dio) = _CommentApiServices;

  @GET('/comments')
  Future<HttpResponse<List<CommentModel>>> getComments(
      {@Query("postId") required int postId});
}
