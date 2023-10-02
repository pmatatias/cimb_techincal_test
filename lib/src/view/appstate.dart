import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String title = "";
  int _activePage = 0;
  int get activePage => _activePage;
  void setActivepage(int newPage) {
    _activePage = newPage;
    notifyListeners();
  }

  void refresh() => notifyListeners();
}
