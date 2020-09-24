import 'package:flutter/material.dart';
import '../flutter_demo_localization.dart';

class FlutterDemoLocalizationDelegate extends LocalizationsDelegate<FlutterDemoLocalization> {
  const FlutterDemoLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    // supported languages
    return ['en' , 'ar'].contains(locale.languageCode);
  }

  @override
  Future<FlutterDemoLocalization> load(Locale locale) async {
    // load json string files
    FlutterDemoLocalization flutterDemoLocalization = FlutterDemoLocalization(locale);
    await flutterDemoLocalization.load();
    return flutterDemoLocalization;
  }

  @override
  bool shouldReload(FlutterDemoLocalizationDelegate old) => false;

}