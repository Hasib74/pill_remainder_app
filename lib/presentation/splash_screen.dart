import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:remainder_flutter/core/route/app_routes.dart';
import 'package:remainder_flutter/core/route/route_provider.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 3), () {
      // ref.read(routerProvider).go(AppRoutes.homeScreen);
      ref.read(routerProvider).go(AppRoutes.homeScreen);
    });

    return const Scaffold(
      body: Center(
        child: LinearProgressIndicator(),
      ),
    );
  }
}
