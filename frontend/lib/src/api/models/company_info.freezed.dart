// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompanyInfo _$CompanyInfoFromJson(Map<String, dynamic> json) {
  return _CompanyInfo.fromJson(json);
}

/// @nodoc
mixin _$CompanyInfo {
  String? get name => throw _privateConstructorUsedError;
  String get ticker => throw _privateConstructorUsedError;
  String? get sector => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock_price')
  String get stockPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'prognosis_percentage')
  String get prognosisPercentage => throw _privateConstructorUsedError;
  StockActionRecommendation get recommendation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'portfolio_uuid')
  String? get portfolioUuid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyInfoCopyWith<CompanyInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyInfoCopyWith<$Res> {
  factory $CompanyInfoCopyWith(
          CompanyInfo value, $Res Function(CompanyInfo) then) =
      _$CompanyInfoCopyWithImpl<$Res, CompanyInfo>;
  @useResult
  $Res call(
      {String? name,
      String ticker,
      String? sector,
      String? description,
      @JsonKey(name: 'stock_price') String stockPrice,
      @JsonKey(name: 'prognosis_percentage') String prognosisPercentage,
      StockActionRecommendation recommendation,
      @JsonKey(name: 'portfolio_uuid') String? portfolioUuid});

  $StockActionRecommendationCopyWith<$Res> get recommendation;
}

/// @nodoc
class _$CompanyInfoCopyWithImpl<$Res, $Val extends CompanyInfo>
    implements $CompanyInfoCopyWith<$Res> {
  _$CompanyInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? ticker = null,
    Object? sector = freezed,
    Object? description = freezed,
    Object? stockPrice = null,
    Object? prognosisPercentage = null,
    Object? recommendation = null,
    Object? portfolioUuid = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      sector: freezed == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      stockPrice: null == stockPrice
          ? _value.stockPrice
          : stockPrice // ignore: cast_nullable_to_non_nullable
              as String,
      prognosisPercentage: null == prognosisPercentage
          ? _value.prognosisPercentage
          : prognosisPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as StockActionRecommendation,
      portfolioUuid: freezed == portfolioUuid
          ? _value.portfolioUuid
          : portfolioUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StockActionRecommendationCopyWith<$Res> get recommendation {
    return $StockActionRecommendationCopyWith<$Res>(_value.recommendation,
        (value) {
      return _then(_value.copyWith(recommendation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CompanyInfoImplCopyWith<$Res>
    implements $CompanyInfoCopyWith<$Res> {
  factory _$$CompanyInfoImplCopyWith(
          _$CompanyInfoImpl value, $Res Function(_$CompanyInfoImpl) then) =
      __$$CompanyInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String ticker,
      String? sector,
      String? description,
      @JsonKey(name: 'stock_price') String stockPrice,
      @JsonKey(name: 'prognosis_percentage') String prognosisPercentage,
      StockActionRecommendation recommendation,
      @JsonKey(name: 'portfolio_uuid') String? portfolioUuid});

  @override
  $StockActionRecommendationCopyWith<$Res> get recommendation;
}

/// @nodoc
class __$$CompanyInfoImplCopyWithImpl<$Res>
    extends _$CompanyInfoCopyWithImpl<$Res, _$CompanyInfoImpl>
    implements _$$CompanyInfoImplCopyWith<$Res> {
  __$$CompanyInfoImplCopyWithImpl(
      _$CompanyInfoImpl _value, $Res Function(_$CompanyInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? ticker = null,
    Object? sector = freezed,
    Object? description = freezed,
    Object? stockPrice = null,
    Object? prognosisPercentage = null,
    Object? recommendation = null,
    Object? portfolioUuid = freezed,
  }) {
    return _then(_$CompanyInfoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      sector: freezed == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      stockPrice: null == stockPrice
          ? _value.stockPrice
          : stockPrice // ignore: cast_nullable_to_non_nullable
              as String,
      prognosisPercentage: null == prognosisPercentage
          ? _value.prognosisPercentage
          : prognosisPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as StockActionRecommendation,
      portfolioUuid: freezed == portfolioUuid
          ? _value.portfolioUuid
          : portfolioUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyInfoImpl implements _CompanyInfo {
  const _$CompanyInfoImpl(
      {this.name,
      required this.ticker,
      this.sector,
      this.description,
      @JsonKey(name: 'stock_price') required this.stockPrice,
      @JsonKey(name: 'prognosis_percentage') required this.prognosisPercentage,
      required this.recommendation,
      @JsonKey(name: 'portfolio_uuid') this.portfolioUuid});

  factory _$CompanyInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyInfoImplFromJson(json);

  @override
  final String? name;
  @override
  final String ticker;
  @override
  final String? sector;
  @override
  final String? description;
  @override
  @JsonKey(name: 'stock_price')
  final String stockPrice;
  @override
  @JsonKey(name: 'prognosis_percentage')
  final String prognosisPercentage;
  @override
  final StockActionRecommendation recommendation;
  @override
  @JsonKey(name: 'portfolio_uuid')
  final String? portfolioUuid;

  @override
  String toString() {
    return 'CompanyInfo(name: $name, ticker: $ticker, sector: $sector, description: $description, stockPrice: $stockPrice, prognosisPercentage: $prognosisPercentage, recommendation: $recommendation, portfolioUuid: $portfolioUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ticker, ticker) || other.ticker == ticker) &&
            (identical(other.sector, sector) || other.sector == sector) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.stockPrice, stockPrice) ||
                other.stockPrice == stockPrice) &&
            (identical(other.prognosisPercentage, prognosisPercentage) ||
                other.prognosisPercentage == prognosisPercentage) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            (identical(other.portfolioUuid, portfolioUuid) ||
                other.portfolioUuid == portfolioUuid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      ticker,
      sector,
      description,
      stockPrice,
      prognosisPercentage,
      recommendation,
      portfolioUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyInfoImplCopyWith<_$CompanyInfoImpl> get copyWith =>
      __$$CompanyInfoImplCopyWithImpl<_$CompanyInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyInfoImplToJson(
      this,
    );
  }
}

abstract class _CompanyInfo implements CompanyInfo {
  const factory _CompanyInfo(
          {final String? name,
          required final String ticker,
          final String? sector,
          final String? description,
          @JsonKey(name: 'stock_price') required final String stockPrice,
          @JsonKey(name: 'prognosis_percentage')
          required final String prognosisPercentage,
          required final StockActionRecommendation recommendation,
          @JsonKey(name: 'portfolio_uuid') final String? portfolioUuid}) =
      _$CompanyInfoImpl;

  factory _CompanyInfo.fromJson(Map<String, dynamic> json) =
      _$CompanyInfoImpl.fromJson;

  @override
  String? get name;
  @override
  String get ticker;
  @override
  String? get sector;
  @override
  String? get description;
  @override
  @JsonKey(name: 'stock_price')
  String get stockPrice;
  @override
  @JsonKey(name: 'prognosis_percentage')
  String get prognosisPercentage;
  @override
  StockActionRecommendation get recommendation;
  @override
  @JsonKey(name: 'portfolio_uuid')
  String? get portfolioUuid;
  @override
  @JsonKey(ignore: true)
  _$$CompanyInfoImplCopyWith<_$CompanyInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockActionRecommendation _$StockActionRecommendationFromJson(
    Map<String, dynamic> json) {
  return _StockActionRecommendation.fromJson(json);
}

/// @nodoc
mixin _$StockActionRecommendation {
  String get color => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockActionRecommendationCopyWith<StockActionRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockActionRecommendationCopyWith<$Res> {
  factory $StockActionRecommendationCopyWith(StockActionRecommendation value,
          $Res Function(StockActionRecommendation) then) =
      _$StockActionRecommendationCopyWithImpl<$Res, StockActionRecommendation>;
  @useResult
  $Res call({String color, String recommendation});
}

/// @nodoc
class _$StockActionRecommendationCopyWithImpl<$Res,
        $Val extends StockActionRecommendation>
    implements $StockActionRecommendationCopyWith<$Res> {
  _$StockActionRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? recommendation = null,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockActionRecommendationImplCopyWith<$Res>
    implements $StockActionRecommendationCopyWith<$Res> {
  factory _$$StockActionRecommendationImplCopyWith(
          _$StockActionRecommendationImpl value,
          $Res Function(_$StockActionRecommendationImpl) then) =
      __$$StockActionRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String color, String recommendation});
}

/// @nodoc
class __$$StockActionRecommendationImplCopyWithImpl<$Res>
    extends _$StockActionRecommendationCopyWithImpl<$Res,
        _$StockActionRecommendationImpl>
    implements _$$StockActionRecommendationImplCopyWith<$Res> {
  __$$StockActionRecommendationImplCopyWithImpl(
      _$StockActionRecommendationImpl _value,
      $Res Function(_$StockActionRecommendationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? recommendation = null,
  }) {
    return _then(_$StockActionRecommendationImpl(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockActionRecommendationImpl implements _StockActionRecommendation {
  const _$StockActionRecommendationImpl(
      {required this.color, required this.recommendation});

  factory _$StockActionRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockActionRecommendationImplFromJson(json);

  @override
  final String color;
  @override
  final String recommendation;

  @override
  String toString() {
    return 'StockActionRecommendation(color: $color, recommendation: $recommendation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockActionRecommendationImpl &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, color, recommendation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockActionRecommendationImplCopyWith<_$StockActionRecommendationImpl>
      get copyWith => __$$StockActionRecommendationImplCopyWithImpl<
          _$StockActionRecommendationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockActionRecommendationImplToJson(
      this,
    );
  }
}

abstract class _StockActionRecommendation implements StockActionRecommendation {
  const factory _StockActionRecommendation(
      {required final String color,
      required final String recommendation}) = _$StockActionRecommendationImpl;

  factory _StockActionRecommendation.fromJson(Map<String, dynamic> json) =
      _$StockActionRecommendationImpl.fromJson;

  @override
  String get color;
  @override
  String get recommendation;
  @override
  @JsonKey(ignore: true)
  _$$StockActionRecommendationImplCopyWith<_$StockActionRecommendationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
