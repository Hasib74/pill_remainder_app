import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:remainder_flutter/core/theme/app_colors.dart';
import 'package:remainder_flutter/presentation/homeScreen/sections/app_bottom_bar.dart';
import 'package:remainder_flutter/presentation/homeScreen/sections/remainderList/remainder_list.dart';
import 'package:remainder_flutter/presentation/homeScreen/sections/top_app_bar.dart';

import '../googleSheet/google_sheet_input.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColor.primaryColor));

    return const Scaffold(
      bottomNavigationBar: AppBottomBar(),
      body: SafeArea(
        child: Column(
          children: [
            TopAppBar(),
            Expanded(
              child: RemainderListScreen(),
            )
          ],
        ),
      ),
    );
  }
}
