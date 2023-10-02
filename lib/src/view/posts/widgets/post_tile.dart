import 'package:cimb_technical_test/src/domain/model.dart';
import 'package:cimb_technical_test/src/utils/pallete.dart';
import 'package:cimb_technical_test/src/view/favorites/fav_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key, required this.data});
  final Post data;

  @override
  Widget build(BuildContext context) {
    final isFav = context.select<FavState, bool>(
      (favs) => favs.favPost.contains(data),
    );
    return Card(
      elevation: 3,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: Palette.fillColor,
      child: ListTile(
        title: Text(
          data.title,
          maxLines: 1,
          style: const TextStyle(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          data.body,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
            color: isFav ? Palette.cRed : Colors.grey,
            onPressed: isFav
                ? () => context.read<FavState>().removeFav(data)
                : () => context.read<FavState>().addFav(data),
            icon: const Icon(
              Icons.favorite,
            )),
      ),
    );
  }
}
