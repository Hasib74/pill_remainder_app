import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remainder_flutter/core/global/global_data.dart';
import 'package:intl/intl.dart';
import 'package:remainder_flutter/l10n/selead/language.dart';

import 'app_language_provider.dart';

AppLocalizations? language(BuildContext context) =>
    AppLocalizations.of(context);

Future<bool> changeLanguage(BuildContext context,
    {String? languageCode, String? countryCode}) async {
  Locale myLocale;

  if (AppGlobalData().locale?.countryCode == "BD") {
    myLocale = const Locale('en', 'US');
  } else {
    myLocale = const Locale('bn', 'BD');
  }

  const provider = AppLocalizations.delegate;

  await provider.load(myLocale);

  // await initializeMessages(locale.toString());
  Intl.defaultLocale = myLocale.toString();

  AppGlobalData().locale = myLocale;



  return true;
}
