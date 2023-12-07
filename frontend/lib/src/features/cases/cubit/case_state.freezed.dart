// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'case_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CaseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Case portfolio, List<Company> companies) stats,
    required TResult Function(
            List<Company> inCase, List<Company> stopped, List<Company> inActive)
        editing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Case portfolio, List<Company> companies)? stats,
    TResult? Function(List<Company> inCase, List<Company> stopped,
            List<Company> inActive)?
        editing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Case portfolio, List<Company> companies)? stats,
    TResult Function(List<Company> inCase, List<Company> stopped,
            List<Company> inActive)?
        editing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Stats value) stats,
    required TResult Function(_Editing value) editing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Stats value)? stats,
    TResult? Function(_Editing value)? editing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Stats value)? stats,
    TResult Function(_Editing value)? editing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseStateCopyWith<$Res> {
  factory $CaseStateCopyWith(CaseState value, $Res Function(CaseState) then) =
      _$CaseStateCopyWithImpl<$Res, CaseState>;
}

/// @nodoc
class _$CaseStateCopyWithImpl<$Res, $Val extends CaseState>
    implements $CaseStateCopyWith<$Res> {
  _$CaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CaseStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CaseState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Case portfolio, List<Company> companies) stats,
    required TResult Function(
            List<Company> inCase, List<Company> stopped, List<Company> inActive)
        editing,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Case portfolio, List<Company> companies)? stats,
    TResult? Function(List<Company> inCase, List<Company> stopped,
            List<Company> inActive)?
        editing,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Case portfolio, List<Company> companies)? stats,
    TResult Function(List<Company> inCase, List<Company> stopped,
            List<Company> inActive)?
        editing,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Stats value) stats,
    required TResult Function(_Editing value) editing,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Stats value)? stats,
    TResult? Function(_Editing value)? editing,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Stats value)? stats,
    TResult Function(_Editing value)? editing,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CaseState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$StatsImplCopyWith<$Res> {
  factory _$$StatsImplCopyWith(
          _$StatsImpl value, $Res Function(_$StatsImpl) then) =
      __$$StatsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Case portfolio, List<Company> companies});

  $CaseCopyWith<$Res> get portfolio;
}

/// @nodoc
class __$$StatsImplCopyWithImpl<$Res>
    extends _$CaseStateCopyWithImpl<$Res, _$StatsImpl>
    implements _$$StatsImplCopyWith<$Res> {
  __$$StatsImplCopyWithImpl(
      _$StatsImpl _value, $Res Function(_$StatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? portfolio = null,
    Object? companies = null,
  }) {
    return _then(_$StatsImpl(
      portfolio: null == portfolio
          ? _value.portfolio
          : portfolio // ignore: cast_nullable_to_non_nullable
              as Case,
      companies: null == companies
          ? _value._companies
          : companies // ignore: cast_nullable_to_non_nullable
              as List<Company>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CaseCopyWith<$Res> get portfolio {
    return $CaseCopyWith<$Res>(_value.portfolio, (value) {
      return _then(_value.copyWith(portfolio: value));
    });
  }
}

/// @nodoc

class _$StatsImpl implements _Stats {
  const _$StatsImpl(
      {required this.portfolio, required final List<Company> companies})
      : _companies = companies;

  @override
  final Case portfolio;
  final List<Company> _companies;
  @override
  List<Company> get companies {
    if (_companies is EqualUnmodifiableListView) return _companies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_companies);
  }

  @override
  String toString() {
    return 'CaseState.stats(portfolio: $portfolio, companies: $companies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsImpl &&
            (identical(other.portfolio, portfolio) ||
                other.portfolio == portfolio) &&
            const DeepCollectionEquality()
                .equals(other._companies, _companies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, portfolio, const DeepCollectionEquality().hash(_companies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsImplCopyWith<_$StatsImpl> get copyWith =>
      __$$StatsImplCopyWithImpl<_$StatsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Case portfolio, List<Company> companies) stats,
    required TResult Function(
            List<Company> inCase, List<Company> stopped, List<Company> inActive)
        editing,
  }) {
    return stats(portfolio, companies);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Case portfolio, List<Company> companies)? stats,
    TResult? Function(List<Company> inCase, List<Company> stopped,
            List<Company> inActive)?
        editing,
  }) {
    return stats?.call(portfolio, companies);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Case portfolio, List<Company> companies)? stats,
    TResult Function(List<Company> inCase, List<Company> stopped,
            List<Company> inActive)?
        editing,
    required TResult orElse(),
  }) {
    if (stats != null) {
      return stats(portfolio, companies);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Stats value) stats,
    required TResult Function(_Editing value) editing,
  }) {
    return stats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Stats value)? stats,
    TResult? Function(_Editing value)? editing,
  }) {
    return stats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Stats value)? stats,
    TResult Function(_Editing value)? editing,
    required TResult orElse(),
  }) {
    if (stats != null) {
      return stats(this);
    }
    return orElse();
  }
}

abstract class _Stats implements CaseState {
  const factory _Stats(
      {required final Case portfolio,
      required final List<Company> companies}) = _$StatsImpl;

  Case get portfolio;
  List<Company> get companies;
  @JsonKey(ignore: true)
  _$$StatsImplCopyWith<_$StatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditingImplCopyWith<$Res> {
  factory _$$EditingImplCopyWith(
          _$EditingImpl value, $Res Function(_$EditingImpl) then) =
      __$$EditingImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Company> inCase, List<Company> stopped, List<Company> inActive});
}

/// @nodoc
class __$$EditingImplCopyWithImpl<$Res>
    extends _$CaseStateCopyWithImpl<$Res, _$EditingImpl>
    implements _$$EditingImplCopyWith<$Res> {
  __$$EditingImplCopyWithImpl(
      _$EditingImpl _value, $Res Function(_$EditingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inCase = null,
    Object? stopped = null,
    Object? inActive = null,
  }) {
    return _then(_$EditingImpl(
      inCase: null == inCase
          ? _value._inCase
          : inCase // ignore: cast_nullable_to_non_nullable
              as List<Company>,
      stopped: null == stopped
          ? _value._stopped
          : stopped // ignore: cast_nullable_to_non_nullable
              as List<Company>,
      inActive: null == inActive
          ? _value._inActive
          : inActive // ignore: cast_nullable_to_non_nullable
              as List<Company>,
    ));
  }
}

/// @nodoc

class _$EditingImpl implements _Editing {
  const _$EditingImpl(
      {required final List<Company> inCase,
      required final List<Company> stopped,
      required final List<Company> inActive})
      : _inCase = inCase,
        _stopped = stopped,
        _inActive = inActive;

  final List<Company> _inCase;
  @override
  List<Company> get inCase {
    if (_inCase is EqualUnmodifiableListView) return _inCase;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inCase);
  }

  final List<Company> _stopped;
  @override
  List<Company> get stopped {
    if (_stopped is EqualUnmodifiableListView) return _stopped;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stopped);
  }

  final List<Company> _inActive;
  @override
  List<Company> get inActive {
    if (_inActive is EqualUnmodifiableListView) return _inActive;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inActive);
  }

  @override
  String toString() {
    return 'CaseState.editing(inCase: $inCase, stopped: $stopped, inActive: $inActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditingImpl &&
            const DeepCollectionEquality().equals(other._inCase, _inCase) &&
            const DeepCollectionEquality().equals(other._stopped, _stopped) &&
            const DeepCollectionEquality().equals(other._inActive, _inActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_inCase),
      const DeepCollectionEquality().hash(_stopped),
      const DeepCollectionEquality().hash(_inActive));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditingImplCopyWith<_$EditingImpl> get copyWith =>
      __$$EditingImplCopyWithImpl<_$EditingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Case portfolio, List<Company> companies) stats,
    required TResult Function(
            List<Company> inCase, List<Company> stopped, List<Company> inActive)
        editing,
  }) {
    return editing(inCase, stopped, inActive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Case portfolio, List<Company> companies)? stats,
    TResult? Function(List<Company> inCase, List<Company> stopped,
            List<Company> inActive)?
        editing,
  }) {
    return editing?.call(inCase, stopped, inActive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Case portfolio, List<Company> companies)? stats,
    TResult Function(List<Company> inCase, List<Company> stopped,
            List<Company> inActive)?
        editing,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(inCase, stopped, inActive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Stats value) stats,
    required TResult Function(_Editing value) editing,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Stats value)? stats,
    TResult? Function(_Editing value)? editing,
  }) {
    return editing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Stats value)? stats,
    TResult Function(_Editing value)? editing,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class _Editing implements CaseState {
  const factory _Editing(
      {required final List<Company> inCase,
      required final List<Company> stopped,
      required final List<Company> inActive}) = _$EditingImpl;

  List<Company> get inCase;
  List<Company> get stopped;
  List<Company> get inActive;
  @JsonKey(ignore: true)
  _$$EditingImplCopyWith<_$EditingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
