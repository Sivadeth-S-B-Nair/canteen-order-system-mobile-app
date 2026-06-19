import 'package:dio/dio.dart';
import '../../../core/constants/api_constants.dart';
import '../domain/order_model.dart';

class OrderRepository {
  final Dio _dio;
  OrderRepository(this._dio);

  Future<List<Order>> getMyDeliveries() async {
    final response = await _dio.get(ApiConstants.myDeliveries);
    if (response.statusCode != 200) {
      throw response.data["message"] ?? "Failed to load deliveries";
    }
    final List<dynamic> data = response.data["data"] as List<dynamic>;
    return data
        .map((json) => Order.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<Order> markDelivered(int orderId) async {
    final response = await _dio.patch(
      ApiConstants.deliveryStatus(orderId),
      data: {"status": "Delivered"},
    );
    if (response.statusCode != 200) {
      throw response.data["message"] ?? "Failed to update status";
    }
    return Order.fromJson(response.data["data"] as Map<String, dynamic>);
  }
}
