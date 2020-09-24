import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  final String title;

  CounterPage({Key key, this.title}) : super(key: key);
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 10;

  void increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  void decreaseCounter() {
    if (_counter > 3) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: decreaseCounter,
                  child: Text('-'),
                ),
                SizedBox(width: 5,),
                Text('$_counter'),
                SizedBox(width: 5,),
                RaisedButton(
                  onPressed: increaseCounter,
                  child: Text('+'),
                ),
              ],
            ),
            Text(
              'This text size should be changed based on counter',
              style: TextStyle(fontSize: _counter.toDouble()),textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
