import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remainder_flutter/domain/home_model.dart';

part 'home_state.freezed.dart';
//part 'home_state.g.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;

  const factory HomeState.loading() = Loading;

  const factory HomeState.success(HomeModel homeModel) = Success;

  const factory HomeState.error() = Error;
}
