// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TokenSchema extends TokenSchema {
  @override
  final JsonObject? accessToken;

  factory _$TokenSchema([void Function(TokenSchemaBuilder)? updates]) =>
      (new TokenSchemaBuilder()..update(updates))._build();

  _$TokenSchema._({this.accessToken}) : super._();

  @override
  TokenSchema rebuild(void Function(TokenSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TokenSchemaBuilder toBuilder() => new TokenSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TokenSchema && accessToken == other.accessToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TokenSchema')
          ..add('accessToken', accessToken))
        .toString();
  }
}

class TokenSchemaBuilder implements Builder<TokenSchema, TokenSchemaBuilder> {
  _$TokenSchema? _$v;

  JsonObject? _accessToken;
  JsonObject? get accessToken => _$this._accessToken;
  set accessToken(JsonObject? accessToken) => _$this._accessToken = accessToken;

  TokenSchemaBuilder() {
    TokenSchema._defaults(this);
  }

  TokenSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TokenSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TokenSchema;
  }

  @override
  void update(void Function(TokenSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TokenSchema build() => _build();

  _$TokenSchema _build() {
    final _$result = _$v ?? new _$TokenSchema._(accessToken: accessToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
