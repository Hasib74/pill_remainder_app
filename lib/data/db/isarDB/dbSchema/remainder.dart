import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_flutter_libs/isar_flutter_libs.dart';
import 'package:remainder_flutter/presentation/addRemainder/enum/days.dart';

import '../../../../presentation/addRemainder/enum/frequency_enum.dart';

part 'remainder.g.dart';

@collection
class Remainder {
  final Id id = Isar.autoIncrement;

  //final String title;
  @Name("remainder_date")
  DateTime? date;

  @Name("medicine_name")
  String? medicineName;

  @ignore
  @Name("remainder_time")
  TimeOfDay? time;

  @Name("remainder_event_type")
  String? eventType;

  @Name("remainder_description")
  String? description;

  @Name("remainder_strength")
  String? strength;

  @Name("remainder_dose")
  String? dose;

  @enumerated
  @Name("remainder_frequency")
  late FrequencyEnum frequency;

  @enumerated
  @Name("remainder_day")
  late DaysEnum day;

  @Name("remainder_duration")
  String? duration;

  @Name("remainder_is_active")
  bool? isActive;
}
