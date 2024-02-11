import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:remainder_flutter/core/theme/app_colors.dart';
import 'package:remainder_flutter/core/theme/app_theme.dart';

import '../provider/selected_date_provider.dart';


class TopAppBar extends ConsumerWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.25,
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          boxShadow: AppTheme.shadow,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  color: AppColor.iconColor,
                ),
                const Icon(Icons.calendar_month),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: _customBackgroundExample(ref),
            ),
            const Gap(8),
          ],
        ),
      ),
    );
  }

  EasyDateTimeLine _customBackgroundExample(WidgetRef ref) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.

        print(selectedDate);

        ref.read(selectedDateProvider.notifier).state = selectedDate;
      },
      itemBuilder:
          (context, dayNumber, dayName, monthName, fullDate, isSelected) {
        // check selected date is less or bigger

        bool? isLess = DateTime.now().isAfter(fullDate);

        bool? isCurrentDate = DateTime.now().day == fullDate.day &&
            DateTime.now().month == fullDate.month &&
            DateTime.now().year == fullDate.year;

        return Container(
          width: 65,
          height: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSelected
                  ? AppColor.secondaryColor
                  : isLess
                      ? AppColor.whiteColor.withOpacity(0.6)
                      : AppColor.whiteColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(dayName,
                  style: TextStyle(
                      color: isSelected
                          ? AppColor.whiteColor
                          : isLess
                              ? AppColor.whiteColor
                              : AppColor.secondaryColor,
                      fontSize: 10)),
              Text(dayNumber,
                  style: TextStyle(
                      color: isSelected
                          ? AppColor.whiteColor
                          : isLess
                              ? AppColor.whiteColor
                              : AppColor.secondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              Visibility(
                visible: isCurrentDate && !isSelected,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        color: AppColor.secondaryColor,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              )
            ],
          ),
        );
      },
      headerProps: const EasyHeaderProps(
        showHeader: false,
        showMonthPicker: false,
        centerHeader: false,
        showSelectedDate: false,
      ),
      timeLineProps: EasyTimeLineProps(
        backgroundColor: AppColor.primaryColor,
        // vPadding: 8
      ),
      dayProps: EasyDayProps(
        height: 75,
        /*dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: AppColor.secondaryColor,
          ),
          dayNumStyle: TextStyle(
            color: AppColor.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          dayStrStyle: TextStyle(
            color: AppColor.whiteColor,
            fontSize: 8,
            fontWeight: FontWeight.normal,
          ),
        ),*/
      ),
    );
  }
}
