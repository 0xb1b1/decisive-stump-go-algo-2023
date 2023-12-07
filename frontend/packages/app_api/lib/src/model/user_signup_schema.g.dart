// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signup_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserSignupSchema extends UserSignupSchema {
  @override
  final JsonObject? email;
  @override
  final JsonObject? passwordHash;
  @override
  final JsonObject? firstName;
  @override
  final JsonObject? lastName;

  factory _$UserSignupSchema(
          [void Function(UserSignupSchemaBuilder)? updates]) =>
      (new UserSignupSchemaBuilder()..update(updates))._build();

  _$UserSignupSchema._(
      {this.email, this.passwordHash, this.firstName, this.lastName})
      : super._();

  @override
  UserSignupSchema rebuild(void Function(UserSignupSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserSignupSchemaBuilder toBuilder() =>
      new UserSignupSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserSignupSchema &&
        email == other.email &&
        passwordHash == other.passwordHash &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, passwordHash.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserSignupSchema')
          ..add('email', email)
          ..add('passwordHash', passwordHash)
          ..add('firstName', firstName)
          ..add('lastName', lastName))
        .toString();
  }
}

class UserSignupSchemaBuilder
    implements Builder<UserSignupSchema, UserSignupSchemaBuilder> {
  _$UserSignupSchema? _$v;

  JsonObject? _email;
  JsonObject? get email => _$this._email;
  set email(JsonObject? email) => _$this._email = email;

  JsonObject? _passwordHash;
  JsonObject? get passwordHash => _$this._passwordHash;
  set passwordHash(JsonObject? passwordHash) =>
      _$this._passwordHash = passwordHash;

  JsonObject? _firstName;
  JsonObject? get firstName => _$this._firstName;
  set firstName(JsonObject? firstName) => _$this._firstName = firstName;

  JsonObject? _lastName;
  JsonObject? get lastName => _$this._lastName;
  set lastName(JsonObject? lastName) => _$this._lastName = lastName;

  UserSignupSchemaBuilder() {
    UserSignupSchema._defaults(this);
  }

  UserSignupSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _passwordHash = $v.passwordHash;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserSignupSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserSignupSchema;
  }

  @override
  void update(void Function(UserSignupSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserSignupSchema build() => _build();

  _$UserSignupSchema _build() {
    final _$result = _$v ??
        new _$UserSignupSchema._(
            email: email,
            passwordHash: passwordHash,
            firstName: firstName,
            lastName: lastName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
