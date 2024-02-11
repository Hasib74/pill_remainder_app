import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:remainder_flutter/core/route/route_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:remainder_flutter/core/theme/app_colors.dart';
import 'package:remainder_flutter/core/theme/app_theme.dart';

import '../core/global/global_data.dart';
import '../l10n/app_language_provider.dart';

class AppWidget extends HookConsumerWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var languageProvider = ref.watch(appLanguageProvider);

    ref.listen(routerProvider, (previous, next) {
      print("Previous :  ${previous}");

      print("Next : ${next}");
    });

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
/*
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,*/

      supportedLocales: const [
        Locale('en', 'US'),
        Locale('bn', 'BD'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate, // Post-EDIT due to croxx5f
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      locale: languageProvider,

      theme: AppTheme.lightTheme,

      // routerConfig: ref.watch(routerProvider).,
    );
  }
}
