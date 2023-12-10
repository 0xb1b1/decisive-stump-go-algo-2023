// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolios_dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PortfoliosDashboard _$PortfoliosDashboardFromJson(Map<String, dynamic> json) {
  return _PortfoliosDashboard.fromJson(json);
}

/// @nodoc
mixin _$PortfoliosDashboard {
  @JsonKey(name: 'stripped_portfolios')
  List<PortfolioStripped> get strippedPortfolios =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PortfoliosDashboardCopyWith<PortfoliosDashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfoliosDashboardCopyWith<$Res> {
  factory $PortfoliosDashboardCopyWith(
          PortfoliosDashboard value, $Res Function(PortfoliosDashboard) then) =
      _$PortfoliosDashboardCopyWithImpl<$Res, PortfoliosDashboard>;
  @useResult
  $Res call(
      {@JsonKey(name: 'stripped_portfolios')
      List<PortfolioStripped> strippedPortfolios});
}

/// @nodoc
class _$PortfoliosDashboardCopyWithImpl<$Res, $Val extends PortfoliosDashboard>
    implements $PortfoliosDashboardCopyWith<$Res> {
  _$PortfoliosDashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strippedPortfolios = null,
  }) {
    return _then(_value.copyWith(
      strippedPortfolios: null == strippedPortfolios
          ? _value.strippedPortfolios
          : strippedPortfolios // ignore: cast_nullable_to_non_nullable
              as List<PortfolioStripped>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PortfoliosDashboardImplCopyWith<$Res>
    implements $PortfoliosDashboardCopyWith<$Res> {
  factory _$$PortfoliosDashboardImplCopyWith(_$PortfoliosDashboardImpl value,
          $Res Function(_$PortfoliosDashboardImpl) then) =
      __$$PortfoliosDashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'stripped_portfolios')
      List<PortfolioStripped> strippedPortfolios});
}

/// @nodoc
class __$$PortfoliosDashboardImplCopyWithImpl<$Res>
    extends _$PortfoliosDashboardCopyWithImpl<$Res, _$PortfoliosDashboardImpl>
    implements _$$PortfoliosDashboardImplCopyWith<$Res> {
  __$$PortfoliosDashboardImplCopyWithImpl(_$PortfoliosDashboardImpl _value,
      $Res Function(_$PortfoliosDashboardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strippedPortfolios = null,
  }) {
    return _then(_$PortfoliosDashboardImpl(
      strippedPortfolios: null == strippedPortfolios
          ? _value._strippedPortfolios
          : strippedPortfolios // ignore: cast_nullable_to_non_nullable
              as List<PortfolioStripped>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PortfoliosDashboardImpl implements _PortfoliosDashboard {
  const _$PortfoliosDashboardImpl(
      {@JsonKey(name: 'stripped_portfolios')
      required final List<PortfolioStripped> strippedPortfolios})
      : _strippedPortfolios = strippedPortfolios;

  factory _$PortfoliosDashboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfoliosDashboardImplFromJson(json);

  final List<PortfolioStripped> _strippedPortfolios;
  @override
  @JsonKey(name: 'stripped_portfolios')
  List<PortfolioStripped> get strippedPortfolios {
    if (_strippedPortfolios is EqualUnmodifiableListView)
      return _strippedPortfolios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strippedPortfolios);
  }

  @override
  String toString() {
    return 'PortfoliosDashboard(strippedPortfolios: $strippedPortfolios)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfoliosDashboardImpl &&
            const DeepCollectionEquality()
                .equals(other._strippedPortfolios, _strippedPortfolios));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_strippedPortfolios));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfoliosDashboardImplCopyWith<_$PortfoliosDashboardImpl> get copyWith =>
      __$$PortfoliosDashboardImplCopyWithImpl<_$PortfoliosDashboardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfoliosDashboardImplToJson(
      this,
    );
  }
}

abstract class _PortfoliosDashboard implements PortfoliosDashboard {
  const factory _PortfoliosDashboard(
          {@JsonKey(name: 'stripped_portfolios')
          required final List<PortfolioStripped> strippedPortfolios}) =
      _$PortfoliosDashboardImpl;

  factory _PortfoliosDashboard.fromJson(Map<String, dynamic> json) =
      _$PortfoliosDashboardImpl.fromJson;

  @override
  @JsonKey(name: 'stripped_portfolios')
  List<PortfolioStripped> get strippedPortfolios;
  @override
  @JsonKey(ignore: true)
  _$$PortfoliosDashboardImplCopyWith<_$PortfoliosDashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
