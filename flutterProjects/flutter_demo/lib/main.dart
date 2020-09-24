import 'package:flutter/material.dart';
import 'package:flutter_demo/page/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/flutter_demo_localization.dart';
import 'localization/localization_constants.dart';

void main() {
  runApp(DemoApp());
}

class DemoApp extends StatefulWidget {
  // This widget is the root of your application.
  static void setLocale(BuildContext context, Locale locale) {
    _DemoAppState state = context.findAncestorStateOfType<_DemoAppState>();
    state.setLocale(locale);
  }

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocal().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {

      return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
      );

    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        locale: _locale,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(title: 'Home Page'),
        supportedLocales: [
          const Locale('en', 'US'), // English, US code
          const Locale('ar', 'EG'), // Arabic, EG code
        ],
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,

          //custom delegate
          FlutterDemoLocalization.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale.languageCode &&
                locale.countryCode == deviceLocale.countryCode) {
              return deviceLocale;
            }
          }

          return supportedLocales.first;
        },
      );
    }
  }
}
