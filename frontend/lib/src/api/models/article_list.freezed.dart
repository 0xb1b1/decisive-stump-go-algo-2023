// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticleList _$ArticleListFromJson(Map<String, dynamic> json) {
  return _ArticleList.fromJson(json);
}

/// @nodoc
mixin _$ArticleList {
  List<Article> get articles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleListCopyWith<ArticleList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleListCopyWith<$Res> {
  factory $ArticleListCopyWith(
          ArticleList value, $Res Function(ArticleList) then) =
      _$ArticleListCopyWithImpl<$Res, ArticleList>;
  @useResult
  $Res call({List<Article> articles});
}

/// @nodoc
class _$ArticleListCopyWithImpl<$Res, $Val extends ArticleList>
    implements $ArticleListCopyWith<$Res> {
  _$ArticleListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
  }) {
    return _then(_value.copyWith(
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleListImplCopyWith<$Res>
    implements $ArticleListCopyWith<$Res> {
  factory _$$ArticleListImplCopyWith(
          _$ArticleListImpl value, $Res Function(_$ArticleListImpl) then) =
      __$$ArticleListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Article> articles});
}

/// @nodoc
class __$$ArticleListImplCopyWithImpl<$Res>
    extends _$ArticleListCopyWithImpl<$Res, _$ArticleListImpl>
    implements _$$ArticleListImplCopyWith<$Res> {
  __$$ArticleListImplCopyWithImpl(
      _$ArticleListImpl _value, $Res Function(_$ArticleListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
  }) {
    return _then(_$ArticleListImpl(
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleListImpl implements _ArticleList {
  const _$ArticleListImpl({required final List<Article> articles})
      : _articles = articles;

  factory _$ArticleListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleListImplFromJson(json);

  final List<Article> _articles;
  @override
  List<Article> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'ArticleList(articles: $articles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleListImpl &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleListImplCopyWith<_$ArticleListImpl> get copyWith =>
      __$$ArticleListImplCopyWithImpl<_$ArticleListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleListImplToJson(
      this,
    );
  }
}

abstract class _ArticleList implements ArticleList {
  const factory _ArticleList({required final List<Article> articles}) =
      _$ArticleListImpl;

  factory _ArticleList.fromJson(Map<String, dynamic> json) =
      _$ArticleListImpl.fromJson;

  @override
  List<Article> get articles;
  @override
  @JsonKey(ignore: true)
  _$$ArticleListImplCopyWith<_$ArticleListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
