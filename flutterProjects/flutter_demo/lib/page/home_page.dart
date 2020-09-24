import 'package:flutter/material.dart';
import 'package:flutter_demo/util/navigation_util.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(children: <Widget>[OutlineButton(
            child: new Text("Goto Register"),
            onPressed: () {
              // Add your onPressed code here!
            },
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0))
        ),
          OutlineButton(
              child: new Text("Goto Counter App"),
              onPressed: () => navigateToCounterPage(context),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0))
          ),
          OutlineButton(
              child: new Text("Goto Colors Game"),
              onPressed: () => navigateToColorsGamePage(context),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0))
          ),OutlineButton(
              child: new Text("Goto HTTP Request"),
              onPressed: () => navigateToHttpRequestPage(context),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0))
          ),OutlineButton(
              child: new Text("Goto Provider Counter"),
              onPressed: () => navigateToProviderCounterPage(context),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0))
          ),

        ],),
      ),
    );
  }
}
