import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:remainder_flutter/core/widgets/app_text_fields.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class SelectScheduleTime extends StatefulWidget {
  Function(TimeOfDay)? onValue;

  SelectScheduleTime({super.key, this.onValue});

  @override
  State<SelectScheduleTime> createState() => _SelectScheduleTimeState();
}

class _SelectScheduleTimeState extends State<SelectScheduleTime> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Time",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Gap(16),
        AppTextFiled(
          isEnable: false,
          textEditingController: textEditingController,
          hint: "Select Time",
          suffixIcon: const Icon(Icons.access_time),
          onTap: () async {
            final result = await showTimePicker(
                context: context, initialTime: TimeOfDay.now());

            if (result != null) {
              setState(() {
                textEditingController.text =
                    "${result.hour}:${result.minute} ${result.hour > 12 ? "PM" : "AM"}";
              });

              if (widget.onValue != null) {
                widget.onValue!(result);
              }
            }
          },
        ),
      ],
    );
  }
}
