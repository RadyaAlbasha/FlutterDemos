import 'package:flutter/material.dart';
import 'package:my_bookmarks/model/bookmark.dart';
import 'package:my_bookmarks/widget/grid/bookmark_grid_item_widget.dart';

class BookMarksGridWidget extends StatelessWidget {
  final List<Bookmark> bookmarksList;

  BookMarksGridWidget(this.bookmarksList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: GridView.builder(
          itemCount: bookmarksList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.5,// height
            crossAxisCount: 2,
            crossAxisSpacing: 6,// space between cards
          ),
          itemBuilder: (BuildContext context, int index) {
            return BookmarkGridItemWidget(bookmarksList[index]);
          }),
    );
  }
}
