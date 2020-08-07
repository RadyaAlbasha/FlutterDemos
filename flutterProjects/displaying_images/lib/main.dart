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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.network(
                'https://picsum.photos/250?image=12',
                height: 200,
              ),
              Image.asset(
                "undrawByMyCarTtge.png",
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
