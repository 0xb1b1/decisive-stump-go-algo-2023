// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StockInfo _$StockInfoFromJson(Map<String, dynamic> json) {
  return _StockInfo.fromJson(json);
}

/// @nodoc
mixin _$StockInfo {
  String get symbol => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get sector => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockInfoCopyWith<StockInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockInfoCopyWith<$Res> {
  factory $StockInfoCopyWith(StockInfo value, $Res Function(StockInfo) then) =
      _$StockInfoCopyWithImpl<$Res, StockInfo>;
  @useResult
  $Res call(
      {String symbol, String? company, String? description, String? sector});
}

/// @nodoc
class _$StockInfoCopyWithImpl<$Res, $Val extends StockInfo>
    implements $StockInfoCopyWith<$Res> {
  _$StockInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? company = freezed,
    Object? description = freezed,
    Object? sector = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sector: freezed == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockInfoImplCopyWith<$Res>
    implements $StockInfoCopyWith<$Res> {
  factory _$$StockInfoImplCopyWith(
          _$StockInfoImpl value, $Res Function(_$StockInfoImpl) then) =
      __$$StockInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String symbol, String? company, String? description, String? sector});
}

/// @nodoc
class __$$StockInfoImplCopyWithImpl<$Res>
    extends _$StockInfoCopyWithImpl<$Res, _$StockInfoImpl>
    implements _$$StockInfoImplCopyWith<$Res> {
  __$$StockInfoImplCopyWithImpl(
      _$StockInfoImpl _value, $Res Function(_$StockInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? company = freezed,
    Object? description = freezed,
    Object? sector = freezed,
  }) {
    return _then(_$StockInfoImpl(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sector: freezed == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockInfoImpl implements _StockInfo {
  const _$StockInfoImpl(
      {required this.symbol, this.company, this.description, this.sector});

  factory _$StockInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockInfoImplFromJson(json);

  @override
  final String symbol;
  @override
  final String? company;
  @override
  final String? description;
  @override
  final String? sector;

  @override
  String toString() {
    return 'StockInfo(symbol: $symbol, company: $company, description: $description, sector: $sector)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockInfoImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sector, sector) || other.sector == sector));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, symbol, company, description, sector);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockInfoImplCopyWith<_$StockInfoImpl> get copyWith =>
      __$$StockInfoImplCopyWithImpl<_$StockInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockInfoImplToJson(
      this,
    );
  }
}

abstract class _StockInfo implements StockInfo {
  const factory _StockInfo(
      {required final String symbol,
      final String? company,
      final String? description,
      final String? sector}) = _$StockInfoImpl;

  factory _StockInfo.fromJson(Map<String, dynamic> json) =
      _$StockInfoImpl.fromJson;

  @override
  String get symbol;
  @override
  String? get company;
  @override
  String? get description;
  @override
  String? get sector;
  @override
  @JsonKey(ignore: true)
  _$$StockInfoImplCopyWith<_$StockInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
