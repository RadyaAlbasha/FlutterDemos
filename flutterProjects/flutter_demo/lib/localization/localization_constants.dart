import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_demo_localization.dart';

String getTranslated(BuildContext context, String key){
  return FlutterDemoLocalization.of(context).getTranslatedValue(key);
}

//language code
const String ENGLISH = 'en';
const String ARABIC = 'ar';

const String LANGUAGE_CODE = 'languageCode';

Future<Locale> setLocal(String languageCode) async{
  SharedPreferences _pref = await SharedPreferences.getInstance();

  await _pref.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}
Locale _locale(String languageCode){
  Locale _temp;
  switch (languageCode) {
    case ENGLISH:
      _temp = Locale(languageCode, 'US');
      break;
    case ARABIC:
      _temp = Locale(languageCode, 'EG');
      break;
    default:
      _temp = Locale(ENGLISH, 'US');
  }
  return _temp;
}

Future<Locale> getLocal() async{
  SharedPreferences _pref = await SharedPreferences.getInstance();
  String languageCode = _pref.getString(LANGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}