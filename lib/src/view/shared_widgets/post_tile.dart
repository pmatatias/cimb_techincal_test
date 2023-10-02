import 'package:cimb_technical_test/src/domain/model.dart';
import 'package:cimb_technical_test/src/utils/pallete.dart';
import 'package:cimb_technical_test/src/view/favorites/fav_state.dart';
import 'package:cimb_technical_test/src/view/posts/post_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key, required this.data, this.showTrailing = true});
  final Post data;
  final bool showTrailing;

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
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostFormScreen(
                data: data,
                isEdit: true,
              ),
            )),
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
        trailing: showTrailing
            ? IconButton(
                color: isFav ? Palette.cRed : Colors.grey,
                onPressed: isFav
                    ? () => context.read<FavState>().removeFav(data)
                    : () => context.read<FavState>().addFav(data),
                icon: const Icon(
                  Icons.favorite,
                ))
            : null,
      ),
    );
  }
}
