import 'package:cimb_technical_test/src/data/post_ds.dart';
import 'package:cimb_technical_test/src/domain/model.dart';
import 'package:cimb_technical_test/src/domain/post_repo.dart';
import 'package:cimb_technical_test/src/utils/http_builder.dart';
import 'package:multiple_result/multiple_result.dart';

const usePosts = UsePostImpl(PostRepoImpl(PostDSImpl(HttpBuilderImpl())));

abstract class UsePost {
  Future<Result<List<Post>, Exception>> getList();
  Future<Result<Post, Exception>> getDetail(int id);

  Future<Result<Post, Exception>> update(Post data);
  Future<Result<Post, Exception>> create(Post data);
}

class UsePostImpl implements UsePost {
  final PostRepo postRepo;
  const UsePostImpl(this.postRepo);

  @override
  Future<Result<Post, Exception>> getDetail(int id) async {
    return await postRepo.getPostDetail(id);
  }

  @override
  Future<Result<List<Post>, Exception>> getList() async {
    return await postRepo.getPostList();
  }

  @override
  Future<Result<Post, Exception>> create(Post data) async {
    return await postRepo.createPost(data);
  }

  @override
  Future<Result<Post, Exception>> update(Post data) async {
    return await postRepo.updatePost(data);
  }
}
