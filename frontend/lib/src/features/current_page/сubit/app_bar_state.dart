import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bar_state.freezed.dart';

@freezed
class AppBarState with _$AppBarState {
  const factory AppBarState.data({
    required double account,
    required double assets,
  }) = _Data;
}
