import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:remainder_flutter/core/mixin/lifecycle_mixin.dart';
import 'package:remainder_flutter/core/theme/app_colors.dart';
import 'package:remainder_flutter/core/widgets/app_button_widgets.dart';
import 'package:remainder_flutter/presentation/addRemainder/controller/remainder_controller.dart';
import 'package:remainder_flutter/presentation/addRemainder/screen/sections/frequency.dart';
import 'package:remainder_flutter/presentation/addRemainder/screen/sections/select_day.dart';
import 'package:remainder_flutter/presentation/addRemainder/screen/sections/select_time.dart';

import '../../homeScreen/sections/strengh/strengh.dart';
import '../../medicine/screen/search_medicine.dart';
import '../enum/days.dart';
import '../enum/frequency_enum.dart';

class AddRemainderScreen extends StatefulWidget {
  const AddRemainderScreen({super.key});

  @override
  State<AddRemainderScreen> createState() => _AddRemainderScreenState();
}

class _AddRemainderScreenState extends State<AddRemainderScreen>
    with SingleTickerProviderStateMixin {
  LifecycleMixin lifecycleMixin = RemainderController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lifecycleMixin.init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    lifecycleMixin.dispose();
    //RemainderController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _topBar(context),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchMedicine((data) {
                      if (kDebugMode) {
                        print("Data is : ${data}");

                        RemainderController.medicineName = data?.name;
                      }
                    }),
                  ),
                  Frequency(
                    onFrequencyEnum: (FrequencyEnum fe) {
                      RemainderController.selectedFrequency = fe;
                    },
                  ),
                  SelectDays(
                    onDaysEnum: (DaysEnum day) {
                      RemainderController.selectedDay = day;
                    },
                  ),
                  const Gap(16),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Strengh(),
                  ),
                  const Gap(16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SelectScheduleTime(
                      onValue: (value) {
                        if (kDebugMode) {
                          print("Value is : ${value}");
                        }
                      },
                    ),
                  ),
                  const Gap(16),
                  const Gap(16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: AppButton(
                      title: "Save",
                      onPressed: () {
                        RemainderController.addRemainder(context);

                        RemainderController.getAllRemainder();
                      },
                    ),
                  ),
                  const Gap(16),
                  const Gap(16),
                  const Gap(16),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  _topBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(15))),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          Text(
            "Add Remainder",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppColor.whiteColor),
          ),
        ],
      ),
    );
  }
}
