import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/order_repository.dart';
import '../domain/order_model.dart';
import '../../auth/providers/auth_provider.dart';
import '../../../shared/socket/socket_service.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return OrderRepository(dio);
});

final socketServiceProvider = Provider<SocketService>((ref) {
  final service = SocketService();
  ref.onDispose(service.disconnect);
  return service;
});

class OrdersState {
  final List<Order> orders;
  final bool isLoading;
  final String? error;

  const OrdersState({
    this.orders = const [],
    this.isLoading = false,
    this.error,
  });

  OrdersState copyWith({List<Order>? orders, bool? isLoading, String? error}) =>
      OrdersState(
        orders: orders ?? this.orders,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      );

  Order? get activeOrder =>
      orders.where((o) => o.status == "Out for Delivery").firstOrNull;
}

class OrdersNotifier extends Notifier<OrdersState> {
  @override
  OrdersState build() {
    _setupSocketListeners();
    return const OrdersState();
  }

  void _setupSocketListeners() {
    final socket = ref.read(socketServiceProvider);

    socket.onNewDelivery((orderData) {
      final newOrder = Order.fromJson(orderData);
      state = state.copyWith(orders: [newOrder, ...state.orders]);
    });

    socket.onOrderUpdated((orderData) {
      final updated = Order.fromJson(orderData);
      final newOrders = state.orders
          .map((o) => o.id == updated.id ? updated : o)
          .toList();
      state = state.copyWith(orders: newOrders);
    });
  }

  Future<void> fetchDeliveries() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repository = ref.read(orderRepositoryProvider);
      final orders = await repository.getMyDeliveries();
      state = state.copyWith(orders: orders, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> markDelivered(int orderId) async {
    try {
      final repository = ref.read(orderRepositoryProvider);
      final updated = await repository.markDelivered(orderId);
      final newOrders = state.orders
          .map((o) => o.id == orderId ? updated : o)
          .toList();
      state = state.copyWith(orders: newOrders);
    } catch (e) {
      rethrow;
    }
  }
}

final ordersProvider = NotifierProvider<OrdersNotifier, OrdersState>(
  OrdersNotifier.new,
);
