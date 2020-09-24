import 'package:flutter/material.dart';
import 'package:flutter_demo/localization/localization_constants.dart';
import 'package:flutter_demo/page/colors_game/colors_game_page.dart';
import 'package:flutter_demo/page/counter/counter_page.dart';
import 'package:flutter_demo/page/http_request/http_request_page.dart';
import 'package:flutter_demo/page/provider_counter/provider_counter_page.dart';

void navigateToCounterPage(BuildContext context){
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => CounterPage(title: 'Counter (Font Size)',)));
}
void navigateToColorsGamePage(BuildContext context){
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ColorsGamePage(getTranslated(context, 'cgPage_Title'),)));
}
void navigateToHttpRequestPage(BuildContext context){
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => HttpRequestPage(getTranslated(context, 'hrPage_Title'),)));
}
void navigateToProviderCounterPage(BuildContext context){
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ProviderCounterPage(title: 'Provider Counter',)));
}