import 'package:cimb_technical_test/src/domain/model.dart';
import 'package:cimb_technical_test/src/utils/pallete.dart';
import 'package:cimb_technical_test/src/view/appstate.dart';
import 'package:cimb_technical_test/src/view/favorites/fav_state.dart';
import 'package:cimb_technical_test/src/view/favorites/favorite_post_page.dart';
import 'package:cimb_technical_test/src/view/page_404.dart';
import 'package:cimb_technical_test/src/view/posts/post_form.dart';
import 'package:cimb_technical_test/src/view/posts/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> nav = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.newspaper), label: "Posts"),
      BottomNavigationBarItem(
          icon: Badge(
              label: Consumer<FavState>(builder: (context, fvState, _) {
                return Text(fvState.favPost.length.toString());
              }),
              child: const Icon(Icons.favorite)),
          label: "Favorites"),
    ];
    final appState = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appState.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Palette.cPurple,
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
        1 => const FavoritePostPage(),
        _ => const Page404(),
      },
      floatingActionButton: switch (appState.activePage) {
        0 => FloatingActionButton(
            backgroundColor: Palette.cGreen,
            shape: const CircleBorder(),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostFormScreen(data: Post.empty()),
                )),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        _ => null,
      },
    );
  }
}
