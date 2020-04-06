import 'package:crab/model/Post.dart';

class PostList {
  List<Post> postList;

  PostList({this.postList});

  factory PostList.fromJson(List<dynamic> jsonList) {
    List<Post> list = jsonList.map((value) => Post.fromJson(value)).toList();
    return PostList(postList: list);
  }
}