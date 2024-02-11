import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:remainder_flutter/core/theme/app_colors.dart';
import 'package:remainder_flutter/core/widgets/app_open_close_widgets.dart';

import '../../addRemainder/screen/add_remainder_screen.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          color: AppColor.cardColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _iconWithBottomText(icon: Icons.home, title: "Home"),
          _addRemainder(),
          _iconWithBottomText(icon: Icons.home, title: "Home"),
        ],
      ),
    );
  }

  _addRemainder() {
    return AppOpenCloseWidget(
        close: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Icon(
              Icons.add,
            ),
          ),
        ),
        open: const AddRemainderScreen());

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
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Icon(
              Icons.add,
            ),
          ),
        );
      },
      openBuilder: (context, action) {
        return const AddRemainderScreen();
      },
    );
  }

  _iconWithBottomText({required IconData icon, required String title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColor.primaryColor,
        ),
        Text(title)
      ],
    );
  }
}
