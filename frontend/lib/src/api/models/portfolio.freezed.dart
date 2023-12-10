// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Portfolio _$PortfolioFromJson(Map<String, dynamic> json) {
  return _Portfolio.fromJson(json);
}

/// @nodoc
mixin _$Portfolio {
  String get uuid => throw _privateConstructorUsedError;
  String get sector => throw _privateConstructorUsedError;
  String get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'profit_weekly_percent')
  String get profitWeeklyPercent => throw _privateConstructorUsedError;
  String get profit => throw _privateConstructorUsedError;
  List<PortfolioStock> get stocks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PortfolioCopyWith<Portfolio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioCopyWith<$Res> {
  factory $PortfolioCopyWith(Portfolio value, $Res Function(Portfolio) then) =
      _$PortfolioCopyWithImpl<$Res, Portfolio>;
  @useResult
  $Res call(
      {String uuid,
      String sector,
      String balance,
      @JsonKey(name: 'profit_weekly_percent') String profitWeeklyPercent,
      String profit,
      List<PortfolioStock> stocks});
}

/// @nodoc
class _$PortfolioCopyWithImpl<$Res, $Val extends Portfolio>
    implements $PortfolioCopyWith<$Res> {
  _$PortfolioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? sector = null,
    Object? balance = null,
    Object? profitWeeklyPercent = null,
    Object? profit = null,
    Object? stocks = null,
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
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      profitWeeklyPercent: null == profitWeeklyPercent
          ? _value.profitWeeklyPercent
          : profitWeeklyPercent // ignore: cast_nullable_to_non_nullable
              as String,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as String,
      stocks: null == stocks
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as List<PortfolioStock>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PortfolioImplCopyWith<$Res>
    implements $PortfolioCopyWith<$Res> {
  factory _$$PortfolioImplCopyWith(
          _$PortfolioImpl value, $Res Function(_$PortfolioImpl) then) =
      __$$PortfolioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String sector,
      String balance,
      @JsonKey(name: 'profit_weekly_percent') String profitWeeklyPercent,
      String profit,
      List<PortfolioStock> stocks});
}

/// @nodoc
class __$$PortfolioImplCopyWithImpl<$Res>
    extends _$PortfolioCopyWithImpl<$Res, _$PortfolioImpl>
    implements _$$PortfolioImplCopyWith<$Res> {
  __$$PortfolioImplCopyWithImpl(
      _$PortfolioImpl _value, $Res Function(_$PortfolioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? sector = null,
    Object? balance = null,
    Object? profitWeeklyPercent = null,
    Object? profit = null,
    Object? stocks = null,
  }) {
    return _then(_$PortfolioImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      sector: null == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      profitWeeklyPercent: null == profitWeeklyPercent
          ? _value.profitWeeklyPercent
          : profitWeeklyPercent // ignore: cast_nullable_to_non_nullable
              as String,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as String,
      stocks: null == stocks
          ? _value._stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as List<PortfolioStock>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PortfolioImpl implements _Portfolio {
  const _$PortfolioImpl(
      {required this.uuid,
      required this.sector,
      this.balance = '0.00',
      @JsonKey(name: 'profit_weekly_percent') this.profitWeeklyPercent = '0.00',
      this.profit = '0.00',
      required final List<PortfolioStock> stocks})
      : _stocks = stocks;

  factory _$PortfolioImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioImplFromJson(json);

  @override
  final String uuid;
  @override
  final String sector;
  @override
  @JsonKey()
  final String balance;
  @override
  @JsonKey(name: 'profit_weekly_percent')
  final String profitWeeklyPercent;
  @override
  @JsonKey()
  final String profit;
  final List<PortfolioStock> _stocks;
  @override
  List<PortfolioStock> get stocks {
    if (_stocks is EqualUnmodifiableListView) return _stocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stocks);
  }

  @override
  String toString() {
    return 'Portfolio(uuid: $uuid, sector: $sector, balance: $balance, profitWeeklyPercent: $profitWeeklyPercent, profit: $profit, stocks: $stocks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.sector, sector) || other.sector == sector) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.profitWeeklyPercent, profitWeeklyPercent) ||
                other.profitWeeklyPercent == profitWeeklyPercent) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            const DeepCollectionEquality().equals(other._stocks, _stocks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      sector,
      balance,
      profitWeeklyPercent,
      profit,
      const DeepCollectionEquality().hash(_stocks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioImplCopyWith<_$PortfolioImpl> get copyWith =>
      __$$PortfolioImplCopyWithImpl<_$PortfolioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfolioImplToJson(
      this,
    );
  }
}

abstract class _Portfolio implements Portfolio {
  const factory _Portfolio(
      {required final String uuid,
      required final String sector,
      final String balance,
      @JsonKey(name: 'profit_weekly_percent') final String profitWeeklyPercent,
      final String profit,
      required final List<PortfolioStock> stocks}) = _$PortfolioImpl;

  factory _Portfolio.fromJson(Map<String, dynamic> json) =
      _$PortfolioImpl.fromJson;

  @override
  String get uuid;
  @override
  String get sector;
  @override
  String get balance;
  @override
  @JsonKey(name: 'profit_weekly_percent')
  String get profitWeeklyPercent;
  @override
  String get profit;
  @override
  List<PortfolioStock> get stocks;
  @override
  @JsonKey(ignore: true)
  _$$PortfolioImplCopyWith<_$PortfolioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
