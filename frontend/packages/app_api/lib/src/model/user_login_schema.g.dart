// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserLoginSchema extends UserLoginSchema {
  @override
  final JsonObject? email;
  @override
  final JsonObject? passwordHash;

  factory _$UserLoginSchema([void Function(UserLoginSchemaBuilder)? updates]) =>
      (new UserLoginSchemaBuilder()..update(updates))._build();

  _$UserLoginSchema._({this.email, this.passwordHash}) : super._();

  @override
  UserLoginSchema rebuild(void Function(UserLoginSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserLoginSchemaBuilder toBuilder() =>
      new UserLoginSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserLoginSchema &&
        email == other.email &&
        passwordHash == other.passwordHash;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, passwordHash.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserLoginSchema')
          ..add('email', email)
          ..add('passwordHash', passwordHash))
        .toString();
  }
}

class UserLoginSchemaBuilder
    implements Builder<UserLoginSchema, UserLoginSchemaBuilder> {
  _$UserLoginSchema? _$v;

  JsonObject? _email;
  JsonObject? get email => _$this._email;
  set email(JsonObject? email) => _$this._email = email;

  JsonObject? _passwordHash;
  JsonObject? get passwordHash => _$this._passwordHash;
  set passwordHash(JsonObject? passwordHash) =>
      _$this._passwordHash = passwordHash;

  UserLoginSchemaBuilder() {
    UserLoginSchema._defaults(this);
  }

  UserLoginSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _passwordHash = $v.passwordHash;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserLoginSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserLoginSchema;
  }

  @override
  void update(void Function(UserLoginSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserLoginSchema build() => _build();

  _$UserLoginSchema _build() {
    final _$result = _$v ??
        new _$UserLoginSchema._(email: email, passwordHash: passwordHash);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
