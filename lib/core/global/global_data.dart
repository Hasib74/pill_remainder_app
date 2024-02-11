import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppGlobalData {
  //singleton
  static final AppGlobalData _appGlobalData = AppGlobalData._internal();

  factory AppGlobalData() {
    return _appGlobalData;
  }

  AppGlobalData._internal();

  Locale? locale = const Locale('en', 'US');
}
