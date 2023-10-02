import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isLogin = false;

  void refresh() => notifyListeners();
}
