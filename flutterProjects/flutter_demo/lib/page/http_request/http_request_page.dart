import 'package:flutter/material.dart';
import 'package:flutter_demo/model/http_request/post.dart';
import 'package:flutter_demo/widget/http_request/post_list_item.dart';
import 'package:http/http.dart' as httpClient;

class HttpRequestPage extends StatefulWidget {
  final String title;

  HttpRequestPage(this.title, {Key key}) : super(key: key);

  @override
  _HttpRequestPageState createState() => _HttpRequestPageState();
}

class _HttpRequestPageState extends State<HttpRequestPage> {
  List<Post> _posts = [];
  bool isLoading = true;
  getData() {
    httpClient.get('https://jsonplaceholder.typicode.com/posts').then((value) {
      print(value.body);
      setState(() {
        _posts = postFromJson(value.body);
        isLoading = false;
      });
    });
  }


  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: isLoading ? Center(child: CircularProgressIndicator()): ListView.builder(
          itemCount: _posts.length,
            itemBuilder: (context, index) => PostListItem(post: _posts[index],),));
  }
}
