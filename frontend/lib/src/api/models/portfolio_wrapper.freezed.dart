// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PortfolioWrapper _$PortfolioWrapperFromJson(Map<String, dynamic> json) {
  return _PortfolioWrapper.fromJson(json);
}

/// @nodoc
mixin _$PortfolioWrapper {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get numberEnd => throw _privateConstructorUsedError;
  int get money => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PortfolioWrapperCopyWith<PortfolioWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioWrapperCopyWith<$Res> {
  factory $PortfolioWrapperCopyWith(
          PortfolioWrapper value, $Res Function(PortfolioWrapper) then) =
      _$PortfolioWrapperCopyWithImpl<$Res, PortfolioWrapper>;
  @useResult
  $Res call({String uuid, String name, int numberEnd, int money});
}

/// @nodoc
class _$PortfolioWrapperCopyWithImpl<$Res, $Val extends PortfolioWrapper>
    implements $PortfolioWrapperCopyWith<$Res> {
  _$PortfolioWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? numberEnd = null,
    Object? money = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      numberEnd: null == numberEnd
          ? _value.numberEnd
          : numberEnd // ignore: cast_nullable_to_non_nullable
              as int,
      money: null == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PortfolioWrapperImplCopyWith<$Res>
    implements $PortfolioWrapperCopyWith<$Res> {
  factory _$$PortfolioWrapperImplCopyWith(_$PortfolioWrapperImpl value,
          $Res Function(_$PortfolioWrapperImpl) then) =
      __$$PortfolioWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, String name, int numberEnd, int money});
}

/// @nodoc
class __$$PortfolioWrapperImplCopyWithImpl<$Res>
    extends _$PortfolioWrapperCopyWithImpl<$Res, _$PortfolioWrapperImpl>
    implements _$$PortfolioWrapperImplCopyWith<$Res> {
  __$$PortfolioWrapperImplCopyWithImpl(_$PortfolioWrapperImpl _value,
      $Res Function(_$PortfolioWrapperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? numberEnd = null,
    Object? money = null,
  }) {
    return _then(_$PortfolioWrapperImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      numberEnd: null == numberEnd
          ? _value.numberEnd
          : numberEnd // ignore: cast_nullable_to_non_nullable
              as int,
      money: null == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PortfolioWrapperImpl implements _PortfolioWrapper {
  const _$PortfolioWrapperImpl(
      {required this.uuid,
      required this.name,
      required this.numberEnd,
      required this.money});

  factory _$PortfolioWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioWrapperImplFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  final int numberEnd;
  @override
  final int money;

  @override
  String toString() {
    return 'PortfolioWrapper(uuid: $uuid, name: $name, numberEnd: $numberEnd, money: $money)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioWrapperImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.numberEnd, numberEnd) ||
                other.numberEnd == numberEnd) &&
            (identical(other.money, money) || other.money == money));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, name, numberEnd, money);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioWrapperImplCopyWith<_$PortfolioWrapperImpl> get copyWith =>
      __$$PortfolioWrapperImplCopyWithImpl<_$PortfolioWrapperImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfolioWrapperImplToJson(
      this,
    );
  }
}

abstract class _PortfolioWrapper implements PortfolioWrapper {
  const factory _PortfolioWrapper(
      {required final String uuid,
      required final String name,
      required final int numberEnd,
      required final int money}) = _$PortfolioWrapperImpl;

  factory _PortfolioWrapper.fromJson(Map<String, dynamic> json) =
      _$PortfolioWrapperImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  int get numberEnd;
  @override
  int get money;
  @override
  @JsonKey(ignore: true)
  _$$PortfolioWrapperImplCopyWith<_$PortfolioWrapperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
