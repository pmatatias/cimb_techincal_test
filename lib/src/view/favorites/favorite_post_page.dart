import 'package:cimb_technical_test/src/view/favorites/fav_state.dart';
import 'package:cimb_technical_test/src/view/shared_widgets/bg_dismissible.dart';
import 'package:cimb_technical_test/src/view/shared_widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePostPage extends StatefulWidget {
  const FavoritePostPage({super.key});

  @override
  State<FavoritePostPage> createState() => _FavoritePostPageState();
}

class _FavoritePostPageState extends State<FavoritePostPage> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<FavState>();
    return state.favPost.isEmpty
        ? const Center(
            child: Text(
              "No Item found",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.favPost.length,
            itemBuilder: (context, index) => Dismissible(
                  key: ValueKey(state.favPost[index].id),
                  background: const BGDissmissible(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) =>
                      state.removeFav(state.favPost[index]),
                  child: PostTile(
                    data: state.favPost[index],
                    showTrailing: false,
                  ),
                ));
  }
}
