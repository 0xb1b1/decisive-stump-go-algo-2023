// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_stripped.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PortfolioStripped _$PortfolioStrippedFromJson(Map<String, dynamic> json) {
  return _PortfolioStripped.fromJson(json);
}

/// @nodoc
mixin _$PortfolioStripped {
  String get uuid => throw _privateConstructorUsedError;
  String get sector => throw _privateConstructorUsedError;
  String get profit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PortfolioStrippedCopyWith<PortfolioStripped> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioStrippedCopyWith<$Res> {
  factory $PortfolioStrippedCopyWith(
          PortfolioStripped value, $Res Function(PortfolioStripped) then) =
      _$PortfolioStrippedCopyWithImpl<$Res, PortfolioStripped>;
  @useResult
  $Res call({String uuid, String sector, String profit});
}

/// @nodoc
class _$PortfolioStrippedCopyWithImpl<$Res, $Val extends PortfolioStripped>
    implements $PortfolioStrippedCopyWith<$Res> {
  _$PortfolioStrippedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? sector = null,
    Object? profit = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      sector: null == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PortfolioStrippedImplCopyWith<$Res>
    implements $PortfolioStrippedCopyWith<$Res> {
  factory _$$PortfolioStrippedImplCopyWith(_$PortfolioStrippedImpl value,
          $Res Function(_$PortfolioStrippedImpl) then) =
      __$$PortfolioStrippedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, String sector, String profit});
}

/// @nodoc
class __$$PortfolioStrippedImplCopyWithImpl<$Res>
    extends _$PortfolioStrippedCopyWithImpl<$Res, _$PortfolioStrippedImpl>
    implements _$$PortfolioStrippedImplCopyWith<$Res> {
  __$$PortfolioStrippedImplCopyWithImpl(_$PortfolioStrippedImpl _value,
      $Res Function(_$PortfolioStrippedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? sector = null,
    Object? profit = null,
  }) {
    return _then(_$PortfolioStrippedImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      sector: null == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PortfolioStrippedImpl implements _PortfolioStripped {
  const _$PortfolioStrippedImpl(
      {required this.uuid, required this.sector, this.profit = '0.00'});

  factory _$PortfolioStrippedImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioStrippedImplFromJson(json);

  @override
  final String uuid;
  @override
  final String sector;
  @override
  @JsonKey()
  final String profit;

  @override
  String toString() {
    return 'PortfolioStripped(uuid: $uuid, sector: $sector, profit: $profit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioStrippedImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.sector, sector) || other.sector == sector) &&
            (identical(other.profit, profit) || other.profit == profit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, sector, profit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioStrippedImplCopyWith<_$PortfolioStrippedImpl> get copyWith =>
      __$$PortfolioStrippedImplCopyWithImpl<_$PortfolioStrippedImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfolioStrippedImplToJson(
      this,
    );
  }
}

abstract class _PortfolioStripped implements PortfolioStripped {
  const factory _PortfolioStripped(
      {required final String uuid,
      required final String sector,
      final String profit}) = _$PortfolioStrippedImpl;

  factory _PortfolioStripped.fromJson(Map<String, dynamic> json) =
      _$PortfolioStrippedImpl.fromJson;

  @override
  String get uuid;
  @override
  String get sector;
  @override
  String get profit;
  @override
  @JsonKey(ignore: true)
  _$$PortfolioStrippedImplCopyWith<_$PortfolioStrippedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
