// lib/features/orders/presentation/dashboard_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/orders_provider.dart';
import '../domain/order_model.dart';
import '../providers/location_provide.dart';
import '../../auth/providers/auth_provider.dart';
import '../../auth/domain/auth_state.dart';
// import '../../../shared/socket/socket_service.dart';
import '../../../shared/widgets/status_badge.dart';
import '../../../shared/widgets/order_items_list.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  // Track whether we've shown the dwell prompt for the current order
  int? _dwellShownForOrderId;

  @override
  void initState() {
    super.initState();
    // Using addPostFrameCallback ensures this runs after the first build.
    // Calling setState or provider reads inside initState can cause issues.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeConnections();
    });
  }

  Future<void> _initializeConnections() async {
    // 1. Connect socket with current access token
    final authState = ref.read(authProvider);
    authState.whenOrNull(
      authenticated: (user, accessToken) {
        ref.read(socketServiceProvider).connect(accessToken);

        // 2. Set up dwell listener
        ref.read(socketServiceProvider).onDeliveryDwell((data) {
          final orderId = data['orderId'] as int?;
          if (orderId != null && orderId != _dwellShownForOrderId) {
            _dwellShownForOrderId = orderId;
            _showDwellDialog(orderId);
          }
        });
      },
    );

    // 3. Fetch orders
    await ref.read(ordersProvider.notifier).fetchDeliveries();
  }

  void _showDwellDialog(int orderId) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Text('📍 ', style: TextStyle(fontSize: 20)),
            Text('At delivery location'),
          ],
        ),
        content: const Text(
          "You've been at the delivery address for 30+ seconds. Has the order been handed over?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Not yet'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              _markDelivered(orderId);
            },
            child: const Text('Yes, mark Delivered'),
          ),
        ],
      ),
    );
  }

  Future<void> _markDelivered(int orderId) async {
    try {
      ref.read(locationProvider.notifier).stopTracking();
      await ref.read(ordersProvider.notifier).markDelivered(orderId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Order marked as delivered ✓')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ordersState = ref.watch(ordersProvider);
    final locationState = ref.watch(locationProvider);
    final activeOrder = ordersState.activeOrder;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () =>
                ref.read(ordersProvider.notifier).fetchDeliveries(),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                ref.read(authProvider.notifier).logout();
              }
            },
            itemBuilder: (ctx) => [
              const PopupMenuItem(value: 'logout', child: Text('Sign out')),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        // Pull-to-refresh: a standard mobile pattern
        onRefresh: () => ref.read(ordersProvider.notifier).fetchDeliveries(),
        child: ordersState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : activeOrder == null
            ? _buildNoActiveDelivery()
            : _buildActiveDelivery(activeOrder, locationState),
      ),
    );
  }

  Widget _buildNoActiveDelivery() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.moped_outlined, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'No active delivery',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.grey[700]),
          ),
          const SizedBox(height: 8),
          Text(
            'Deliveries assigned to you will appear here',
            style: TextStyle(color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildActiveDelivery(Order order, LocationState locationState) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // ── Order card ─────────────────────────────────────────────────────
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order #${order.id}',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        if (order.createdAt != null)
                          Text(
                            DateFormat('d MMM, h:mm a').format(
                              DateTime.parse(order.createdAt!).toLocal(),
                            ),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: Colors.grey[500]),
                          ),
                      ],
                    ),
                    StatusBadge(status: order.status),
                  ],
                ),
                const SizedBox(height: 12),
                OrderItemsList(items: order.orderItems),

                // ── Delivery address ──────────────────────────────────────
                if (order.deliveryAddress != null) ...[
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 18,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Deliver to',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                            Text(order.deliveryAddress!.addressLine),
                            if (order.deliveryAddress!.city != null)
                              Text(
                                [
                                  order.deliveryAddress!.city,
                                  order.deliveryAddress!.state,
                                  order.deliveryAddress!.pincode,
                                ].whereType<String>().join(', '),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            if (order.deliveryAddress!.phone != null)
                              Text(
                                '📞 ${order.deliveryAddress!.phone}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            if (order.deliveryAddress!.latitude != null)
                              const Text(
                                '✓ Map pin available',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                              )
                            else
                              const Text(
                                '⚠ No map pin — geofence inactive',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 12,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],

                if (order.estimatedDeliveryTime != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    'ETA: ${DateFormat('h:mm a').format(DateTime.parse(order.estimatedDeliveryTime!).toLocal())}',
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // ── Location sharing card ──────────────────────────────────────────
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location Sharing',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Share your live location so the customer can track their delivery',
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                const SizedBox(height: 16),

                // GPS readout when tracking
                if (locationState.lastPosition != null) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.satellite_alt,
                                  size: 16,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'GPS Active',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            // Accuracy badge
                            _AccuracyBadge(
                              accuracy: locationState.lastPosition!.accuracy,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${locationState.lastPosition!.latitude.toStringAsFixed(6)}, '
                          '${locationState.lastPosition!.longitude.toStringAsFixed(6)}',
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          '${locationState.pingCount} update${locationState.pingCount != 1 ? "s" : ""} sent',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                // GPS error banner
                if (locationState.error != null) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red[200]!),
                    ),
                    child: Text(
                      '⚠️ ${locationState.error}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                // Start/Stop button
                SizedBox(
                  width: double.infinity,
                  child: locationState.isTracking
                      ? OutlinedButton.icon(
                          onPressed: () => ref
                              .read(locationProvider.notifier)
                              .stopTracking(),
                          icon: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                          label: const Text('Stop Sharing Location'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        )
                      : FilledButton.icon(
                          onPressed: () => ref
                              .read(locationProvider.notifier)
                              .startTracking(order.id),
                          icon: const Icon(Icons.satellite_alt),
                          label: const Text('Start Sharing Location'),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // ── Mark delivered button ──────────────────────────────────────────
        FilledButton.icon(
          onPressed: () => _markDelivered(order.id),
          icon: const Icon(Icons.check_circle_outline),
          label: const Text(
            'Mark as Delivered',
            style: TextStyle(fontSize: 16),
          ),
          style: FilledButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    );
  }
}

class _AccuracyBadge extends StatelessWidget {
  final double accuracy;
  const _AccuracyBadge({required this.accuracy});

  @override
  Widget build(BuildContext context) {
    final isGood = accuracy < 20;
    final isFair = accuracy < 60;
    final color = isGood
        ? Colors.green
        : isFair
        ? Colors.orange
        : Colors.red;
    final label = isGood
        ? 'good'
        : isFair
        ? 'fair'
        : 'poor';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '±${accuracy.round()}m ($label)',
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
