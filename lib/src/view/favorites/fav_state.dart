import 'package:cimb_technical_test/src/domain/model.dart';
import 'package:flutter/material.dart';

class FavState extends ChangeNotifier {
  late List<Post> _posts;
  final List<int> postIds = [];
  List<Post> get favPost => postIds
      .map((e) => _posts.firstWhere((element) => element.id == e))
      .toList();

  set posts(List<Post> newPost) {
    _posts = newPost;
    notifyListeners();
  }

  void addFav(Post newFav) {
    if (postIds.contains(newFav.id)) return;
    postIds.add(newFav.id);
    notifyListeners();
  }

  void removeFav(Post item) {
    postIds.remove(item.id);
    notifyListeners();
  }
}
