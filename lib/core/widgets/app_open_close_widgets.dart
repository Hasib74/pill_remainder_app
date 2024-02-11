import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppOpenCloseWidget extends StatelessWidget {
  Widget open;

  Widget close;

  AppOpenCloseWidget({super.key, required this.close, required this.open});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 500),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      closedElevation: 10,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      closedColor: AppColor.secondaryColor,
      openColor: AppColor.primaryColor,
      openShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      useRootNavigator: true,
      closedBuilder: (context, action) {
        return close;
      },
      openBuilder: (context, action) {
        return open;
      },
    );
    ;
  }
}
