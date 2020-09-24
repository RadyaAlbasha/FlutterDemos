import 'package:flutter/material.dart';
import 'package:flutter_demo/model/provider_counter/counter.dart';
import 'package:provider/provider.dart';

class ButtonCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return RaisedButton(color: counter.number % 2 == 0 ? Colors.green : Colors.blue,
        child: Text('Click'),
        onPressed: (){
          counter.increment();
          print(counter.number);
        });
  }
}
