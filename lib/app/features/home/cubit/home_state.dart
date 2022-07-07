part of 'home_cubit.dart';

// @immutable
// class HomeState {
//   const HomeState({
//     this.items = const [],
//     this.loadingErrorOccured = false,
//     this.removingErrorOccured = false,
//   });

//   final List<ItemModel> items;
//   final bool loadingErrorOccured;
//   final bool removingErrorOccured;
// }

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default([]) List<ItemModel> items,
    @Default(false) bool loadingErrorOccured,
    @Default(false) bool removingErrorOccured,
  }) = _HomeState;
}
