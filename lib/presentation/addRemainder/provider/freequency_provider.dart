import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remainder_flutter/presentation/addRemainder/enum/frequency_enum.dart';

var frequencyProvider = StateProvider((ref) => FrequencyEnum.everyDay);
