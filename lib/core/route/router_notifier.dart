import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:remainder_flutter/domain/authentication.dart';
import 'package:remainder_flutter/presentation/homeScreen/home_screen.dart';
import 'package:remainder_flutter/presentation/splash_screen.dart';

import '../../presentation/onBoarding/on_boarding_screen.dart';
import 'app_routes.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen(checkAuthorizeProvider, (previous, next) {
      print("checkAuthorizeProvider Previous :  ${previous}");
      print("checkAuthorizeProvider Next : ${next}");
    });





    /*_ref.listen<AuthState>(
      authNotifierProvider,
          (_, __) => notifyListeners(),
    );*/
  }

  /* String? redirectLogic(BuildContext context, GoRouterState state) {
    final authState = _ref.read(authNotifierProvider);

    final areWeSigningIn = state.matchedLocation == RouteNames.signInRoute;

    return authState.maybeMap(
      authenticated: (_) => areWeSigningIn ? RouteNames.homeRoute : null,
      orElse: () => areWeSigningIn ? null : RouteNames.signInRoute,
    );
  }
*/
  List<GoRoute> get routes {
    return [
      GoRoute(
        name: AppRoutes.splashScreen,
        path: AppRoutes.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        name: AppRoutes.homeScreen,
        path: AppRoutes.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
          path: AppRoutes.onBoarding,
          name: AppRoutes.onBoarding,
          builder: (context, state) => const ObBoardingScreen()),
    ];
  }
}
