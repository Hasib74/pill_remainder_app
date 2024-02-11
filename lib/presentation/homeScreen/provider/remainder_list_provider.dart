import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remainder_flutter/core/response/app_response.dart';
import 'package:remainder_flutter/presentation/addRemainder/controller/remainder_controller.dart';
import 'package:remainder_flutter/presentation/addRemainder/service/add_remainder_service.dart';

import '../../../core/response/app_response.dart';
import '../../../data/db/isarDB/dbSchema/remainder.dart';

var remainderProvider = StateNotifierProvider<RemainderProvider, AppResponse<List<Remainder>>>((ref) {
  return RemainderProvider();
});


class RemainderProvider extends StateNotifier<AppResponse<List<Remainder>>> {
  RemainderProvider() : super(Loading("Loading..."));

  getRemainder() async {
    RemainderService remainderController = RemainderService();
    var remainderList = await remainderController.getAllRemainder();

    remainderList.fold((l) {
     state =  Error(l.message);
    }, (r) {
      state = Success(r);
    });
  }

  void addRemainder(Remainder remainder) {
    // state = [...state, remainder];
  }

  void removeRemainder(Remainder remainder) {
    // state = state.where((element) => element != remainder).toList();
  }
}
