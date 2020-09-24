import 'package:flutter/material.dart';
import 'package:flutter_demo/localization/localization_constants.dart';
import 'package:flutter_demo/model/colors_game/language.dart';

import '../../main.dart';

class ChangeLanguageButtonWidget extends StatelessWidget {
  BuildContext _context;

  ChangeLanguageButtonWidget(this._context);

  void _changeLanguage(Language language) {
    getLocal().then((locale) async {
      if (language.languageCode != locale.languageCode) {
        Locale _temp = await setLocal(language.languageCode);
        DemoApp.setLocale(_context, _temp);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: DropdownButton(
          underline: SizedBox(),
          icon: Icon(
            Icons.language,
            color: Colors.white,
          ),
          items: Language.languageList()
              .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                    value: lang,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          lang.name,
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(lang.flag),
                      ],
                    ),
                  ))
              .toList(),
          onChanged: (Language language) {
            _changeLanguage(language);
          }),
    );
  }
}
