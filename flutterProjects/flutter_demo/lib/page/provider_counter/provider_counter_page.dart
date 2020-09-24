import 'package:flutter/material.dart';
import 'package:flutter_demo/model/provider_counter/counter.dart';
import 'package:flutter_demo/widget/provider_counter/button_custom_widget.dart';
import 'package:flutter_demo/widget/provider_counter/text_custom_widget.dart';
import 'package:provider/provider.dart';

class ProviderCounterPage extends StatelessWidget {
  final String title;
  ProviderCounterPage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: ChangeNotifierProvider<Counter>(
            create: (context)=> Counter(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextCustomWidget(),
                ButtonCustomWidget()
              ],
            ),
          ),
        ));
  }
}
