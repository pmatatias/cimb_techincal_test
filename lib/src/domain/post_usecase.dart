import 'package:cimb_technical_test/src/domain/model.dart';
import 'package:cimb_technical_test/src/domain/post_repo.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class UsePost {
  Future<Result<List<Post>, Exception>> getList();
  Future<Result<Post, Exception>> getDetail(int id);
}

class UsePostImpl implements UsePost {
  final PostRepo postRepo;
  UsePostImpl(this.postRepo);

  @override
  Future<Result<Post, Exception>> getDetail(int id) async {
    return await postRepo.getPostDetail(id);
  }

  @override
  Future<Result<List<Post>, Exception>> getList() async {
    return await postRepo.getPostList();
  }
}
