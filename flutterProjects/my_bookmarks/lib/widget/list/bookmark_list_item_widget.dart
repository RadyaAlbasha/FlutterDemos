import 'package:flutter/material.dart';
import 'package:my_bookmarks/model/bookmark.dart';
import 'package:my_bookmarks/util/navigation_util.dart';

class BookmarkListItemWidget extends StatelessWidget {
  final Bookmark bookmark;

  BookmarkListItemWidget(this.bookmark);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () => navigateToViewBookmarkPage(bookmark, context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  bookmark.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  bookmark.link,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
            Hero(
                tag: bookmark.link,
                child: Icon(
                  Icons.star,
                  size: 40,
                ))
          ],
        ),
      ),
    );
  }
}
