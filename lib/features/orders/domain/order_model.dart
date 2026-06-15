import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

class DoubleConverter implements JsonConverter<double, dynamic> {
  const DoubleConverter();
  @override
  double fromJson(dynamic val) =>
      val is String ? double.parse(val) : (val as num).toDouble();
  @override
  dynamic toJson(double val) => val;
}

class NullableDoubleConverter implements JsonConverter<double?, dynamic> {
  const NullableDoubleConverter();
  @override
  double? fromJson(dynamic val) {
    if (val == null) return null;
    return val is String ? double.tryParse(val) : (val as num).toDouble();
  }
  @override
  dynamic toJson(double? val) => val;
}

@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    required int id,
    required String snapshotName,
    @DoubleConverter() required double snapshotPrice,
    required int qty,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@freezed
abstract class DeliveryAddress with _$DeliveryAddress {
  const factory DeliveryAddress({
    required int id,
    required String addressLine,
    String? city,
    String? state,
    String? pincode,
    String? phone,
    @NullableDoubleConverter() double? latitude,
    @NullableDoubleConverter() double? longitude,
  }) = _DeliveryAddress;

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressFromJson(json);
}

@freezed
abstract class AssignedAgent with _$AssignedAgent {
  const factory AssignedAgent({
    required int id,
    required String name,
  }) = _AssignedAgent;

  factory AssignedAgent.fromJson(Map<String, dynamic> json) =>
      _$AssignedAgentFromJson(json);
}

@freezed
abstract class Order with _$Order {
  const factory Order({
    required int id,
    required String status,
    required String deliveryType,
    @DoubleConverter() required double totalPrice,
    required List<OrderItem> orderItems,
    DeliveryAddress? deliveryAddress,
    AssignedAgent? assignedAgent,
    String? estimatedDeliveryTime,
    String? createdAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}