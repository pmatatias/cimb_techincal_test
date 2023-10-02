import 'dart:convert';

import 'package:cimb_technical_test/src/domain/model.dart';
import 'package:cimb_technical_test/src/utils/http_builder.dart';

abstract class PostDS {
  /// get data
  Future<List<Post>> fetchPostList();

  /// get detail
  Future<Post> fetchPostDetail(int id);

  /// update Post
  /// delete post
  /// etc
}

class PostDSImpl implements PostDS {
  final HttpBuilder httpBuilder;

  const PostDSImpl(this.httpBuilder);

  @override
  Future<List<Post>> fetchPostList() async {
    final response = await httpBuilder.getHandler(path: '/posts');
    return (jsonDecode(response.body) as List)
        .map((e) => Post.fromJson(e))
        .toList();
  }

  @override
  Future<Post> fetchPostDetail(int id) async {
    final response = await httpBuilder.getHandler(path: '/posts/$id');
    return Post.fromJson(jsonDecode(response.body));
  }
}
