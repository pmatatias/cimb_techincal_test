import 'package:cimb_technical_test/src/domain/model.dart';
import 'package:cimb_technical_test/src/domain/post_usecase.dart';
import 'package:flutter/material.dart';

class PostState extends ChangeNotifier {
  PostState() {
    initFetch();
  }

  bool isLoading = true;
  String errorMsg = "";
  List<Post> postList = [];

  Future<void> initFetch() async {
    isLoading = true;
    errorMsg = "";
    notifyListeners();
    final getdata = await usePosts.getList();
    getdata.whenSuccess((success) => postList = success);
    getdata.whenError((error) => errorMsg = error.toString());
    isLoading = false;
    notifyListeners();
  }
}
