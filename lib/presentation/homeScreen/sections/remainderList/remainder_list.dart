import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:remainder_flutter/core/response/app_response.dart';
import 'package:remainder_flutter/data/db/isarDB/dbSchema/remainder.dart';
import 'package:remainder_flutter/presentation/addRemainder/enum/days.dart';
import 'package:remainder_flutter/presentation/addRemainder/enum/frequency_enum.dart';

import '../../provider/remainder_list_provider.dart';
import '../../provider/selected_date_provider.dart';

class RemainderListScreen extends HookConsumerWidget {
  const RemainderListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _remainderProvider = ref.watch(remainderProvider);
    ref.listen(selectedDateProvider, (previous, next) {
      print("previous $previous");
      print("next $next");
    });

    ref.read(remainderProvider.notifier).getRemainder();

    switch (_remainderProvider) {
      case final Success<List<Remainder>> data:
        // TODO: Handle this case.

        return ListView.separated(
          shrinkWrap: true,
          itemCount: data.data.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(data.data[index].medicineName ?? ""),
                    Text(_day(data.data[index].day) ?? ""),
                    Text(_frequncy(data.data[index].frequency) ?? ""),
                    Text(data.data[index].strength ?? ""),
                    Text(data.data[index].time.toString() ?? ""),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Gap(16);
          },
        );

      case Loading<List<Remainder>>():
        // TODO: Handle this case.

        return CircularProgressIndicator();
      case Error<List<Remainder>>():
        // TODO: Handle this case.

        return Text("Error .... ");
    }

    // TODO: implement build
  }

  _day(DaysEnum day) {
    return day.name;
  }

  _frequncy(FrequencyEnum frequency) {
    return frequency.name;
  }
}
