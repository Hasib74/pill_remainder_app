import 'package:flutter/material.dart';
import 'package:remainder_flutter/presentation/addRemainder/service/add_remainder_service.dart';
import 'package:toastification/toastification.dart';

import '../../../core/mixin/lifecycle_mixin.dart';
import '../../../data/db/isarDB/dbSchema/remainder.dart';
import '../enum/days.dart';
import '../enum/frequency_enum.dart';
import 'package:toastification/toastification.dart';

class RemainderController with LifecycleMixin {
  static String? medicineName;

  static FrequencyEnum? selectedFrequency;

  static DaysEnum? selectedDay;

  static String? selectedStrength;

  static String? selectedTime;

  static final RemainderService _RemainderService = RemainderService();

  static addRemainder(BuildContext context) async {
    print("medicineName : == > ${medicineName} ");
    // _RemainderService.addRemainder(remainder);

    if (selectedDay == null) {
      toastification.show(
          context: context,
          title: const Text("Validation Error"),
          description: const Text("Please select day"));
      return;
    }

    if (selectedFrequency == null) {
      toastification.show(
          context: context,
          title: const Text("Validation Error"),
          description: const Text("Please select frequency"));

      return;
    }

    Remainder remainder = Remainder()
      ..time = TimeOfDay.now()
      ..day = selectedDay!
      ..frequency = selectedFrequency!
      ..medicineName = medicineName;

    var _res = await _RemainderService.addRemainder(remainder);

    print("_res : == > ${_res} ");

    return;
  }

  updateRemainder(Remainder remainder) {
    // Update remainder in the database

    _RemainderService.updateRemainder(remainder);
  }

  deleteRemainder(Remainder remainder) {
    // Delete remainder from the database

    _RemainderService.deleteRemainder(remainder);
  }

  static getAllRemainder() {
    // Get all remainders from the database

    _RemainderService.getAllRemainder();
  }

  @override
  dispose() {
    print("RemainderController dispose called");
    _clearAllData();
  }

  @override
  init() {
    print("RemainderController init called");
  }

  void _clearAllData() {
    medicineName = null;
    selectedFrequency = null;
    selectedTime = null;
    selectedStrength = null;
  }
}
