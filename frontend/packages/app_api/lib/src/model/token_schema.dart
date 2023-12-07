//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'token_schema.g.dart';

/// TokenSchema
///
/// Properties:
/// * [accessToken] 
@BuiltValue()
abstract class TokenSchema implements Built<TokenSchema, TokenSchemaBuilder> {
  @BuiltValueField(wireName: r'access_token')
  JsonObject? get accessToken;

  TokenSchema._();

  factory TokenSchema([void updates(TokenSchemaBuilder b)]) = _$TokenSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TokenSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TokenSchema> get serializer => _$TokenSchemaSerializer();
}

class _$TokenSchemaSerializer implements PrimitiveSerializer<TokenSchema> {
  @override
  final Iterable<Type> types = const [TokenSchema, _$TokenSchema];

  @override
  final String wireName = r'TokenSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TokenSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'access_token';
    yield object.accessToken == null ? null : serializers.serialize(
      object.accessToken,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TokenSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TokenSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'access_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.accessToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TokenSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TokenSchemaBuilder();
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

