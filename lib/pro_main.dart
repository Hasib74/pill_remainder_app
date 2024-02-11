import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:remainder_flutter/presentation/app_widgets.dart';

import 'core/env/env.dart';

void main() => Main();

class Main extends Env {
  @override
  Future<HookConsumerWidget> onCreate() async  {
    return AppWidget();
  }
}
