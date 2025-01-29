import '../../domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({super.body, super.id, super.title});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      body: json['body'] as String?,
      id: json['id'] as int?,
      title: json['title'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {'body': body, 'id': id, 'title': title};
  }
}
