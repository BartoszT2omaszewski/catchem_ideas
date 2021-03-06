// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  List<ItemModel> get items => throw _privateConstructorUsedError;
  bool get loadingErrorOccured => throw _privateConstructorUsedError;
  bool get removingErrorOccured => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {List<ItemModel> items,
      bool loadingErrorOccured,
      bool removingErrorOccured});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? loadingErrorOccured = freezed,
    Object? removingErrorOccured = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      loadingErrorOccured: loadingErrorOccured == freezed
          ? _value.loadingErrorOccured
          : loadingErrorOccured // ignore: cast_nullable_to_non_nullable
              as bool,
      removingErrorOccured: removingErrorOccured == freezed
          ? _value.removingErrorOccured
          : removingErrorOccured // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<ItemModel> items,
      bool loadingErrorOccured,
      bool removingErrorOccured});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, (v) => _then(v as _$_HomeState));

  @override
  _$_HomeState get _value => super._value as _$_HomeState;

  @override
  $Res call({
    Object? items = freezed,
    Object? loadingErrorOccured = freezed,
    Object? removingErrorOccured = freezed,
  }) {
    return _then(_$_HomeState(
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      loadingErrorOccured: loadingErrorOccured == freezed
          ? _value.loadingErrorOccured
          : loadingErrorOccured // ignore: cast_nullable_to_non_nullable
              as bool,
      removingErrorOccured: removingErrorOccured == freezed
          ? _value.removingErrorOccured
          : removingErrorOccured // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  _$_HomeState(
      {final List<ItemModel> items = const [],
      this.loadingErrorOccured = false,
      this.removingErrorOccured = false})
      : _items = items;

  final List<ItemModel> _items;
  @override
  @JsonKey()
  List<ItemModel> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool loadingErrorOccured;
  @override
  @JsonKey()
  final bool removingErrorOccured;

  @override
  String toString() {
    return 'HomeState(items: $items, loadingErrorOccured: $loadingErrorOccured, removingErrorOccured: $removingErrorOccured)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other.loadingErrorOccured, loadingErrorOccured) &&
            const DeepCollectionEquality()
                .equals(other.removingErrorOccured, removingErrorOccured));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(loadingErrorOccured),
      const DeepCollectionEquality().hash(removingErrorOccured));

  @JsonKey(ignore: true)
  @override
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {final List<ItemModel> items,
      final bool loadingErrorOccured,
      final bool removingErrorOccured}) = _$_HomeState;

  @override
  List<ItemModel> get items => throw _privateConstructorUsedError;
  @override
  bool get loadingErrorOccured => throw _privateConstructorUsedError;
  @override
  bool get removingErrorOccured => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
