import 'package:flutter/material.dart';
import 'package:my_bookmarks/model/bookmark.dart';
import 'package:my_bookmarks/widget/list/bookmark_list_item_widget.dart';
//import 'package:my_bookmarks/widget/list/bookmark_list_tile_widget.dart';

class BookMarksListWidget extends StatelessWidget {
  final List<Bookmark> bookmarksList;

  BookMarksListWidget(this.bookmarksList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: bookmarksList.length,
        itemBuilder: (BuildContext context, int index) {
          return BookmarkListItemWidget(bookmarksList[index]);
          //return BookmarkListTileWidget(bookmarksList[index]);
        });
  }
}
