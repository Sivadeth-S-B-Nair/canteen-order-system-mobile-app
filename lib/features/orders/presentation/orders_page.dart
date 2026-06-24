// lib/features/orders/presentation/orders_page.dart
//
// Shows ALL orders assigned to this agent — both active ("Out for Delivery")
// and completed ("Delivered"), sourced from the same ordersProvider that the
// DashboardPage already uses. No extra API call needed.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/orders_provider.dart';
import '../domain/order_model.dart';
import '../../../shared/widgets/status_badge.dart';
import '../../../shared/widgets/order_items_list.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersState = ref.watch(ordersProvider);

    // Split into two buckets. The server only ever returns
    // "Out for Delivery" and "Delivered" for this agent, so
    // these two lists cover everything.
    final active = ordersState.orders
        .where((o) => o.status == 'Out for Delivery')
        .toList();
    final delivered = ordersState.orders
        .where((o) => o.status == 'Delivered')
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Deliveries'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () => ref.read(ordersProvider.notifier).fetchDeliveries(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(ordersProvider.notifier).fetchDeliveries(),
        child: ordersState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ordersState.orders.isEmpty
                ? _EmptyState()
                : _OrderList(active: active, delivered: delivered),
      ),
    );
  }
}

// ── List ──────────────────────────────────────────────────────────────────────

class _OrderList extends StatelessWidget {
  final List<Order> active;
  final List<Order> delivered;

  const _OrderList({required this.active, required this.delivered});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      children: [
        // ── Active section ─────────────────────────────────────────────────
        if (active.isNotEmpty) ...[
          _SectionHeader(
            label: 'Active',
            count: active.length,
            color: Colors.teal,
          ),
          const SizedBox(height: 8),
          ...active.map((o) => _OrderCard(order: o, isActive: true)),
          const SizedBox(height: 20),
        ],

        // ── Completed section ──────────────────────────────────────────────
        if (delivered.isNotEmpty) ...[
          _SectionHeader(
            label: 'Completed',
            count: delivered.length,
            color: Colors.grey,
          ),
          const SizedBox(height: 8),
          ...delivered.map((o) => _OrderCard(order: o, isActive: false)),
        ],
      ],
    );
  }
}

// ── Section header ────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const _SectionHeader({
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
                letterSpacing: 0.5,
              ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '$count',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Order card ────────────────────────────────────────────────────────────────
//
// Tappable card that expands to show order items and delivery address.
// Keeping expansion local to each card avoids lifting state up.

class _OrderCard extends StatefulWidget {
  final Order order;
  final bool isActive;

  const _OrderCard({required this.order, required this.isActive});

  @override
  State<_OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<_OrderCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final theme = Theme.of(context);

    // Active orders get a subtle left-border accent so they pop visually.
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: widget.isActive
            ? Border(
                left: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 3,
                ),
              )
            : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        // Slightly lower elevation for completed orders — they're less urgent.
        elevation: widget.isActive ? 2 : 1,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Header row: order # + status + chevron ─────────────────
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order #${order.id}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (order.createdAt != null) ...[
                            const SizedBox(height: 2),
                            Text(
                              DateFormat('d MMM, h:mm a').format(
                                DateTime.parse(order.createdAt!).toLocal(),
                              ),
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(color: Colors.grey[500]),
                            ),
                          ],
                        ],
                      ),
                    ),
                    StatusBadge(status: order.status),
                    const SizedBox(width: 8),
                    AnimatedRotation(
                      turns: _expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: const Icon(Icons.expand_more, size: 20),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // ── Summary row: item count + total ────────────────────────
                Row(
                  children: [
                    Icon(Icons.shopping_bag_outlined,
                        size: 14, color: Colors.grey[500]),
                    const SizedBox(width: 4),
                    Text(
                      '${order.orderItems.length} item${order.orderItems.length != 1 ? "s" : ""}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                    const Spacer(),
                    Text(
                      '₹${order.totalPrice.toStringAsFixed(2)}',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),

                // ── Address preview (always visible) ──────────────────────
                if (order.deliveryAddress != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 14, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          order.deliveryAddress!.addressLine,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],

                // ── Expanded detail ────────────────────────────────────────
                if (_expanded) ...[
                  const SizedBox(height: 12),
                  const Divider(height: 1),
                  const SizedBox(height: 12),

                  // Items breakdown
                  Text(
                    'Items',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  OrderItemsList(items: order.orderItems),

                  // Full delivery address
                  if (order.deliveryAddress != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      'Delivery Address',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    _AddressBlock(address: order.deliveryAddress!),
                  ],

                  // ETA (only relevant while active)
                  if (order.estimatedDeliveryTime != null) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.access_time,
                            size: 14, color: Colors.grey[500]),
                        const SizedBox(width: 4),
                        Text(
                          'ETA: ${DateFormat('h:mm a').format(DateTime.parse(order.estimatedDeliveryTime!).toLocal())}',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Address block ─────────────────────────────────────────────────────────────

class _AddressBlock extends StatelessWidget {
  final DeliveryAddress address;
  const _AddressBlock({required this.address});

  @override
  Widget build(BuildContext context) {
    final cityLine = [
      address.city,
      address.state,
      address.pincode,
    ].whereType<String>().join(', ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(address.addressLine, style: const TextStyle(fontSize: 13)),
        if (cityLine.isNotEmpty)
          Text(
            cityLine,
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),
        if (address.phone != null)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              '📞 ${address.phone}',
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
          ),
      ],
    );
  }
}

// ── Empty state ───────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.local_shipping_outlined,
              size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'No deliveries yet',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.grey[700]),
          ),
          const SizedBox(height: 8),
          Text(
            'Orders assigned to you will appear here',
            style: TextStyle(color: Colors.grey[500], fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}