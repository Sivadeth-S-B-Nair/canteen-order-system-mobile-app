// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => _OrderItem(
  id: (json['id'] as num).toInt(),
  snapshotName: json['snapshotName'] as String,
  snapshotPrice: const DoubleConverter().fromJson(json['snapshotPrice']),
  qty: (json['qty'] as num).toInt(),
);

Map<String, dynamic> _$OrderItemToJson(_OrderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'snapshotName': instance.snapshotName,
      'snapshotPrice': const DoubleConverter().toJson(instance.snapshotPrice),
      'qty': instance.qty,
    };

_DeliveryAddress _$DeliveryAddressFromJson(Map<String, dynamic> json) =>
    _DeliveryAddress(
      id: (json['id'] as num).toInt(),
      addressLine: json['addressLine'] as String,
      city: json['city'] as String?,
      state: json['state'] as String?,
      pincode: json['pincode'] as String?,
      phone: json['phone'] as String?,
      latitude: const NullableDoubleConverter().fromJson(json['latitude']),
      longitude: const NullableDoubleConverter().fromJson(json['longitude']),
    );

Map<String, dynamic> _$DeliveryAddressToJson(_DeliveryAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addressLine': instance.addressLine,
      'city': instance.city,
      'state': instance.state,
      'pincode': instance.pincode,
      'phone': instance.phone,
      'latitude': const NullableDoubleConverter().toJson(instance.latitude),
      'longitude': const NullableDoubleConverter().toJson(instance.longitude),
    };

_AssignedAgent _$AssignedAgentFromJson(Map<String, dynamic> json) =>
    _AssignedAgent(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$AssignedAgentToJson(_AssignedAgent instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: (json['id'] as num).toInt(),
  status: json['status'] as String,
  deliveryType: json['deliveryType'] as String,
  totalPrice: const DoubleConverter().fromJson(json['totalPrice']),
  orderItems: (json['orderItems'] as List<dynamic>)
      .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  deliveryAddress: json['deliveryAddress'] == null
      ? null
      : DeliveryAddress.fromJson(
          json['deliveryAddress'] as Map<String, dynamic>,
        ),
  assignedAgent: json['assignedAgent'] == null
      ? null
      : AssignedAgent.fromJson(json['assignedAgent'] as Map<String, dynamic>),
  estimatedDeliveryTime: json['estimatedDeliveryTime'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'deliveryType': instance.deliveryType,
  'totalPrice': const DoubleConverter().toJson(instance.totalPrice),
  'orderItems': instance.orderItems,
  'deliveryAddress': instance.deliveryAddress,
  'assignedAgent': instance.assignedAgent,
  'estimatedDeliveryTime': instance.estimatedDeliveryTime,
  'createdAt': instance.createdAt,
};
