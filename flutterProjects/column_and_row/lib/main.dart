import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Container(
          color: Colors.lightBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(height: 50,color: Colors.deepOrange, child: Text("Column")),
              Container(color: Colors.orange, child: Text("Column")),
              Container(color: Colors.yellow, child: Text("Column")),
            ],
          ),
        ),
      ),
    );
  }
}
