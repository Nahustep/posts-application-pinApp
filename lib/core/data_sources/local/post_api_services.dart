import 'package:shared_preferences/shared_preferences.dart';

class LocalPostApiServices {
  final SharedPreferences prefs;

  LocalPostApiServices({required this.prefs});
  static const String savedPostsKey = "saved_posts";
  Future<void> savePost(int postId) async {
    final savedPosts = prefs.getStringList(savedPostsKey) ?? [];
    if (!savedPosts.contains(postId.toString())) {
      savedPosts.add(postId.toString());
      await prefs.setStringList(savedPostsKey, savedPosts);
    }
  }

  Future<void> removePost(int postId) async {
    final savedPosts = prefs.getStringList(savedPostsKey) ?? [];
    savedPosts.remove(postId.toString());
    await prefs.setStringList(savedPostsKey, savedPosts);
  }

  bool isPostSaved(int postId) {
    final savedPosts = prefs.getStringList(savedPostsKey) ?? [];
    return savedPosts.contains(postId.toString());
  }

  Set<int> getfavoritePosts() {
    final savedPosts = prefs.getStringList(savedPostsKey) ?? [];
    return savedPosts.map(int.parse).toSet();
  }
}
