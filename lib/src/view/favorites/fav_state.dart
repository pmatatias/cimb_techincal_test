import 'package:cimb_technical_test/src/domain/model.dart';
import 'package:flutter/material.dart';

class FavState extends ChangeNotifier {
  late List<Post> posts;
  List<Post> favPost = [];
  final List<int> _favItemId = [];

  void addFav(Post newFav) {
    if (favPost.contains(newFav)) return;
    favPost.add(newFav);
    notifyListeners();
  }

  void removeFav(Post item) {
    favPost.remove(item);
    notifyListeners();
  }
}
