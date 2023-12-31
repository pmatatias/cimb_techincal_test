import 'package:cimb_technical_test/src/data/post_ds.dart';
import 'package:cimb_technical_test/src/domain/model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class PostRepo {
  Future<Result<List<Post>, Exception>> getPostList();
  Future<Result<Post, Exception>> getPostDetail(int id);
  Future<Result<Post, Exception>> updatePost(Post data);
  Future<Result<Post, Exception>> createPost(Post data);
}

class PostRepoImpl implements PostRepo {
  final PostDS postDS;

  const PostRepoImpl(this.postDS);

  @override
  Future<Result<Post, Exception>> getPostDetail(int id) async {
    try {
      final result = await postDS.fetchPostDetail(id);
      return Success(result);
    } catch (e) {
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<List<Post>, Exception>> getPostList() async {
    try {
      final result = await postDS.fetchPostList();
      return Success(result);
    } catch (e) {
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<Post, Exception>> createPost(Post data) async {
    try {
      final result = await postDS.createPost(data);
      return Success(result);
    } catch (e) {
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<Post, Exception>> updatePost(Post data) async {
    try {
      final result = await postDS.updatePost(data);
      return Success(result);
    } catch (e) {
      return Error(Exception(e));
    }
  }
}
