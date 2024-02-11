import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_flavor.dart';

abstract class Env {
  Flavor? flavor;

  Env({this.flavor}) {
    _init();
  }

  _init() async {
    if (kReleaseMode) {
      // Used to prevent printing in release mode
      debugPrint = (String? message, {int? wrapWidth}) {};
    }

    unawaited(runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();

      BuildConfig.init(flavor: Flavor.development);

      final app = await onCreate();

      runApp(ProviderScope(child: app));
    }, (error, stack) {
      debugPrint(error.toString());
      debugPrint(stack.toString());
    }));
  }

  Future<HookConsumerWidget> onCreate();
}
