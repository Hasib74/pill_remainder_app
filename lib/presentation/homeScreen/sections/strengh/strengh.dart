import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/app_text_fields.dart';

class Strengh extends StatelessWidget {
  const Strengh({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Strength",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Gap(8),
        AppTextFiled(
          hint: "Enter Strength",
          textEditingController: TextEditingController(),
        ),
      ],
    );
  }
}
