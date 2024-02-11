import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:remainder_flutter/core/route/app_routes.dart';
import 'package:remainder_flutter/generated/assets.dart';

import '../../l10n/app_language_provider.dart';
import '../../l10n/language.dart';

import 'package:riverpod/riverpod.dart';

class ObBoardingScreen extends ConsumerWidget {
  const ObBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CupertinoApp(
        home: OnBoardingSlider(
          hasFloatingButton: false,
          hasSkip: false,

          skipFunctionOverride: () {
            print("Skip");

            /*setState(() {
              changeLanguage(
                context,
              );
            });*/

            ref.read(appLanguageProvider.notifier).changeLanguage();
          },

          // headerBackgroundColor: Colors.transparent,
          finishButtonText: 'Go',
          centerBackground: true,
          finishButtonStyle: const FinishButtonStyle(
            backgroundColor: Colors.black,
          ),
          skipTextButton: const Text('Skip'),
          trailing: InkWell(
              onTap: () {
                context.pushReplacementNamed(AppRoutes.homeScreen);
              },
              child: const Text('Go')),
          background: [
            _background(context, Assets.imagesOnBoarding01),
            _background(context, Assets.imagesOnBoarding02),
            _background(context, Assets.imagesOnBoarding03),
            _background(context, Assets.imagesOnBoarding04),
            _background(context, Assets.imagesOnBoarding05),
            _background(context, Assets.imagesOnBoarding06),
            _background(context, Assets.imagesOnBoarding07),
          ],
          totalPage: 7,
          //speed: 1.8,
          pageBodies: [
            _pageBody(context, language(context)!.onBoarding ?? ''),
            _pageBody(context, language(context)!.onBoardingTwo ?? ''),
            _pageBody(context, language(context)!.onBoardingThree ?? ''),
            _pageBody(context, language(context)!.onBoardingFour ?? ''),
            _pageBody(context, language(context)!.onBoardingFive ?? ''),
            _pageBody(context, language(context)!.onBoardingSix ?? ''),
            _pageBody(context, language(context)!.onBoardingSeven ?? ''),
          ],
          speed: 1,
          headerBackgroundColor: Colors.white,
        ),
      ),
    );
  }

  SizedBox _background(BuildContext context, String image) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Image(
            image: AssetImage(
              image ?? Assets.imagesOnBoarding01,
            ),
            fit: BoxFit.fitWidth,
          ),
          Positioned.fill(
              child: Container(
            color: Colors.black.withOpacity(0.5),
          )),
        ],
      ),
    );
  }

  Container _pageBody(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /*  const SizedBox(
                  height: 480,
                ),*/
          Text(
            title ?? "",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}
