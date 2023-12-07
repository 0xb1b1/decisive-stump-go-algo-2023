//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_login_schema.g.dart';

/// UserLoginSchema
///
/// Properties:
/// * [email] 
/// * [passwordHash] 
@BuiltValue()
abstract class UserLoginSchema implements Built<UserLoginSchema, UserLoginSchemaBuilder> {
  @BuiltValueField(wireName: r'email')
  JsonObject? get email;

  @BuiltValueField(wireName: r'password_hash')
  JsonObject? get passwordHash;

  UserLoginSchema._();

  factory UserLoginSchema([void updates(UserLoginSchemaBuilder b)]) = _$UserLoginSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserLoginSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserLoginSchema> get serializer => _$UserLoginSchemaSerializer();
}

class _$UserLoginSchemaSerializer implements PrimitiveSerializer<UserLoginSchema> {
  @override
  final Iterable<Type> types = const [UserLoginSchema, _$UserLoginSchema];

  @override
  final String wireName = r'UserLoginSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserLoginSchema object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    UserLoginSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserLoginSchemaBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserLoginSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserLoginSchemaBuilder();
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

