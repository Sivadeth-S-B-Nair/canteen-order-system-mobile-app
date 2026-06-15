// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AgentUser _$AgentUserFromJson(Map<String, dynamic> json) => _AgentUser(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
  restaurantId: (json['restaurantId'] as num?)?.toInt(),
);

Map<String, dynamic> _$AgentUserToJson(_AgentUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'restaurantId': instance.restaurantId,
    };
