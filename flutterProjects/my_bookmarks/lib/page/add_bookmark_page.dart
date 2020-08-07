import 'package:flutter/material.dart';
import 'package:my_bookmarks/model/bookmark.dart';

class AddBookmarkPage extends StatefulWidget {
  @override
  _AddBookmarkPageState createState() => _AddBookmarkPageState();
}

class _AddBookmarkPageState extends State<AddBookmarkPage> {
  final _titleTextController = TextEditingController();

  final _linkTextController = TextEditingController();

  final _linkFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new bookmark"),
      ),
      floatingActionButton: Builder(builder: (BuildContext context){
        return FloatingActionButton(
            child: Icon(Icons.check),
            backgroundColor: Colors.green,
            onPressed: (){
              String title = _titleTextController.text;
              String link = _linkTextController.text;
              Scaffold.of(context).hideCurrentSnackBar();
              if (isInputValid(title, link)){
                Navigator.pop(context,Bookmark(title, link));
              }else{
                showInputError(context,title, link);
              }
            });
      }
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _titleTextController,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (textInput){
                FocusScope.of(context).requestFocus(_linkFocusNode);
              },
              decoration: InputDecoration(
                icon: Icon(Icons.title),
                labelText: "Title",
                hintText: "Title of the bookmark",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 16,),
            TextFormField(
              controller: _linkTextController,
              focusNode: _linkFocusNode,
              decoration: InputDecoration(
                  icon: Icon(Icons.link),
                  labelText: "URL",
                  hintText: "Webpage link",
                  border: OutlineInputBorder()
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _linkFocusNode.dispose();
    _titleTextController.dispose();
    _linkTextController.dispose();
    super.dispose();
  }

  bool isInputValid(String title , String link){
    return title.isNotEmpty && link.isNotEmpty;
  }

  void showInputError(BuildContext context,String title, String link) {
    String msg;
    if (title.isEmpty){
      msg = "Title cannot be Empty";
    }else if(link.isEmpty){
      msg = "Link cannot be Empty";
    }
    showSnakBar(context,msg);
  }

  void showSnakBar(BuildContext context,String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}