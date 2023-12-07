//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_signup_schema.g.dart';

/// UserSignupSchema
///
/// Properties:
/// * [email] 
/// * [passwordHash] 
/// * [firstName] 
/// * [lastName] 
@BuiltValue()
abstract class UserSignupSchema implements Built<UserSignupSchema, UserSignupSchemaBuilder> {
  @BuiltValueField(wireName: r'email')
  JsonObject? get email;

  @BuiltValueField(wireName: r'password_hash')
  JsonObject? get passwordHash;

  @BuiltValueField(wireName: r'first_name')
  JsonObject? get firstName;

  @BuiltValueField(wireName: r'last_name')
  JsonObject? get lastName;

  UserSignupSchema._();

  factory UserSignupSchema([void updates(UserSignupSchemaBuilder b)]) = _$UserSignupSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserSignupSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserSignupSchema> get serializer => _$UserSignupSchemaSerializer();
}

class _$UserSignupSchemaSerializer implements PrimitiveSerializer<UserSignupSchema> {
  @override
  final Iterable<Type> types = const [UserSignupSchema, _$UserSignupSchema];

  @override
  final String wireName = r'UserSignupSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserSignupSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'email';
    yield object.email == null ? null : serializers.serialize(
      object.email,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'password_hash';
    yield object.passwordHash == null ? null : serializers.serialize(
      object.passwordHash,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'first_name';
    yield object.firstName == null ? null : serializers.serialize(
      object.firstName,
      specifiedType: const FullType.nullable(JsonObject),
    );
    if (object.lastName != null) {
      yield r'last_name';
      yield serializers.serialize(
        object.lastName,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserSignupSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserSignupSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'password_hash':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.passwordHash = valueDes;
          break;
        case r'first_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.firstName = valueDes;
          break;
        case r'last_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.lastName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserSignupSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserSignupSchemaBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

