
import 'package:flutter/material.dart';
import 'package:my_bookmarks/model/bookmark.dart';
import 'package:my_bookmarks/page/add_bookmark_page.dart';
import 'package:my_bookmarks/page/view_bookmark_page.dart';

void navigateToViewBookmarkPage(Bookmark bookmark,BuildContext context){
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ViewBookmarkPage(bookmark)));
}

Future navigateToAddBookmarkPage(BuildContext context){
    return Navigator.of(context).push(MaterialPageRoute(
        builder:
        _onFABPressed)); //or you can use: MaterialPageRoute(builder: (context) => AddbookmarkPage())
}
Widget _onFABPressed(BuildContext context) {
  return AddBookmarkPage();
}