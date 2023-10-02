import 'package:cimb_technical_test/src/utils/pallete.dart';
import 'package:cimb_technical_test/src/view/appstate.dart';
import 'package:cimb_technical_test/src/view/page_404.dart';
import 'package:cimb_technical_test/src/view/posts/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BottomNavigationBarItem> nav = [
    const BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Posts"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite), label: "Favorites"),
  ];
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(appState.title),
        backgroundColor: Palette.cBgColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: appState.activePage,
          selectedItemColor: Palette.cBlue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (value) {
            appState.title = nav[value].label ?? '';
            appState.setActivepage(value);
          },
          type: BottomNavigationBarType.fixed,
          items: nav),
      body: switch (appState.activePage) {
        0 => const PostsPage(),
        _ => const Page404(),
      },
    );
  }
}
