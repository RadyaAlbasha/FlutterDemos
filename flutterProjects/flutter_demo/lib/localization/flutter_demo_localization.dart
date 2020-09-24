import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'delegate/flutter_demo_localization_delegate.dart';

class FlutterDemoLocalization{
  final Locale locale;

  FlutterDemoLocalization(this.locale);

  static FlutterDemoLocalization of(BuildContext context) {
    return Localizations.of<FlutterDemoLocalization>(context, FlutterDemoLocalization);
  }

  Map<String , String> _localzedValues;
  
  Future load() async{
    String jsonStringValues = await rootBundle.loadString('lib/localization/lang/${locale.languageCode}.json');

    Map<String,dynamic> mappedJson = json.decode(jsonStringValues);
    
    _localzedValues = mappedJson.map((key, value) => MapEntry(key, value));
  }

  String getTranslatedValue(String key){
    return _localzedValues[key];
  }

  static const LocalizationsDelegate<FlutterDemoLocalization> delegate = FlutterDemoLocalizationDelegate();
}