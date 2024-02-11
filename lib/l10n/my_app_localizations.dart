/*
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class MyAppLocalizations {
  static MyAppLocalizations? of(BuildContext context) {
    return Localizations.of<MyAppLocalizations>(context, MyAppLocalizations);
  }

  String get hello {
    return Intl.message('Hello', name: 'hello');
  }

  // Add more localized strings here

  static const LocalizationsDelegate<MyAppLocalizations> delegate =
  _MyAppLocalizationsDelegate();
}

class _MyAppLocalizationsDelegate
    extends LocalizationsDelegate<MyAppLocalizations> {
  const _MyAppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'bd'].contains(locale.languageCode);
  }

  @override
  Future<MyAppLocalizations> load(Locale locale) async {
    Intl.defaultLocale = locale.languageCode;
    return MyAppLocalizations();
  }

  @override
  bool shouldReload(LocalizationsDelegate<MyAppLocalizations> old) => false;
}
*/
