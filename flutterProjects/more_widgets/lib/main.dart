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
          title: Text("My Home Page"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(24),
            alignment: Alignment.center,
            constraints: BoxConstraints.expand(height: 300),
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              border: Border.all(
                width: 5,
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(color: Colors.cyan ,child: Text("This is a Text widget, This widget is inside a container widget",textAlign: TextAlign.center,)),
          ),
        ),
      ),
    );
  }
}
