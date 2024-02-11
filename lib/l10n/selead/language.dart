import 'dart:ui';

enum AppLanguage {
  en,
  bn;

  Locale get locale {
    switch (this) {
      case AppLanguage.en:
        return const Locale('en', 'US');
      case AppLanguage.bn:
        return const Locale('bn', 'BD');
      default:
        return const Locale('en', 'US');
    }
  }
}
