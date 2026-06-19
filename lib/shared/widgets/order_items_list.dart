// lib/shared/widgets/order_items_list.dart

import 'package:flutter/material.dart';
import '../../features/orders/domain/order_model.dart';

class OrderItemsList extends StatelessWidget {
  final List<OrderItem> items;
  const OrderItemsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Text('No items', style: TextStyle(color: Colors.grey));
    }
    return Column(
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${item.snapshotName} × ${item.qty}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    '₹${(item.snapshotPrice * item.qty).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
