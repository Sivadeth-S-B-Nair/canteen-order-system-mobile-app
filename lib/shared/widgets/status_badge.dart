// lib/shared/widgets/status_badge.dart

import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;
  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final config = _getConfig(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: config.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        config.label,
        style: TextStyle(
          color: config.textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  ({Color background, Color textColor, String label}) _getConfig(
    String status,
  ) {
    return switch (status) {
      'CONFIRMED' => (
        background: Colors.indigo[100]!,
        textColor: Colors.indigo[800]!,
        label: 'Confirmed',
      ),
      'Cooking' => (
        background: Colors.blue[100]!,
        textColor: Colors.blue[800]!,
        label: 'Cooking',
      ),
      'Ready' => (
        background: Colors.green[100]!,
        textColor: Colors.green[800]!,
        label: 'Ready',
      ),
      'Out for Delivery' => (
        background: Colors.teal[100]!,
        textColor: Colors.teal[800]!,
        label: 'Out for Delivery',
      ),
      'Delivered' => (
        background: Colors.teal[50]!,
        textColor: Colors.teal[700]!,
        label: 'Delivered',
      ),
      'CANCELLED' => (
        background: Colors.grey[200]!,
        textColor: Colors.grey[600]!,
        label: 'Cancelled',
      ),
      _ => (
        background: Colors.grey[100]!,
        textColor: Colors.grey[700]!,
        label: status,
      ),
    };
  }
}
