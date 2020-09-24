import 'package:flutter/material.dart';
import 'package:flutter_demo/model/http_request/post.dart';
class PostListItem extends StatelessWidget {
  final Post post;

  const PostListItem({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      margin: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Text('userId: ${post.userId}'),
          Text('Title: ${post.title}'),
          Text('Body: ${post.body}',maxLines: 2,),
        ],
      ),
    );
  }
}
