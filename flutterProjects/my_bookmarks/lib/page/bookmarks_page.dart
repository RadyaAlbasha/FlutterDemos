import 'package:flutter/material.dart';
import 'package:my_bookmarks/model/bookmark.dart';
import 'package:my_bookmarks/util/navigation_util.dart';
import 'package:my_bookmarks/widget/grid/bookmarks_grid_widget.dart';
import 'package:my_bookmarks/widget/list/bookmarks_list_widget.dart';

class BookmarksPage extends StatefulWidget {
  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  // Bookmark("Flutter", "https://flutter.dev"),
  //    Bookmark("Google", "https://google.com")
  bool isGridMood = false;
  List<Bookmark> bookmarksList = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Bookmarks"),
          actions: <Widget>[
            IconButton(
                icon: isGridMood
                    ? Icon(
                        Icons.list,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.grid_on,
                        color: Colors.white,
                      ),
                onPressed: () {
                  setState(() {
                    isGridMood = !isGridMood;
                  });
                })
          ],
        ),
        body: Container(
          child: isGridMood ? BookMarksGridWidget(bookmarksList):
              BookMarksListWidget(bookmarksList),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.add),
            onPressed: () => onAddButtonPressed(context),
            label: Text("Add")),
      ),
    );
  }

  onAddButtonPressed(BuildContext context) async {
    final result = await navigateToAddBookmarkPage(context);
    // the rest of code well be execute after first line finish execute because we use (await) keyword
    if (result != null && result is Bookmark) {
      setState(() {
        bookmarksList.add(result);
      });
    }
  }
}
