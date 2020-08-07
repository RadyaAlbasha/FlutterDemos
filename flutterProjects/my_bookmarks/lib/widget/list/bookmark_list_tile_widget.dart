import 'package:flutter/material.dart';
import 'package:my_bookmarks/model/bookmark.dart';
import 'package:my_bookmarks/util/navigation_util.dart';

class BookmarkListTileWidget extends StatelessWidget {
  final Bookmark bookmark;

  BookmarkListTileWidget(this.bookmark);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(bookmark.title,style: Theme.of(context).textTheme.headline6,),
      subtitle: Text(bookmark.link,style: Theme.of(context).textTheme.subtitle1,),
      onTap: () => print(bookmark.title),
    );
  }
}
