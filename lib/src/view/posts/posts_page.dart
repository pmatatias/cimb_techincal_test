import 'package:cimb_technical_test/src/utils/pallete.dart';
import 'package:cimb_technical_test/src/view/posts/post_state.dart';
import 'package:cimb_technical_test/src/view/posts/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostState>(
      builder: (context, state, child) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (state.errorMsg.isNotEmpty) {
            return Center(
              child: Text(
                state.errorMsg,
                style: const TextStyle(color: Palette.cRed),
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: state.initFetch,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.postList.length,
                itemBuilder: (context, index) => PostTile(
                  data: state.postList[index],
                ),
              ),
            );
          }
        }
      },
    );
  }
}
