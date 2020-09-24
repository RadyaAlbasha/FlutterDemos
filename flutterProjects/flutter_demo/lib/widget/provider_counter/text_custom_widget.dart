import 'package:flutter/material.dart';
import 'package:flutter_demo/model/provider_counter/counter.dart';
import 'package:provider/provider.dart';

class TextCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Text(counter.number.toString(), style: TextStyle(fontSize: 50),);
  }
}