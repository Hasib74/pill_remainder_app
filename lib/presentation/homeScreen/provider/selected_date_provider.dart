import 'package:flutter_riverpod/flutter_riverpod.dart';

var selectedDateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});
