import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/index_controller.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final Color? color;

  Badge({
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final total = Provider.of<CartController>(context).itemCount;
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 2,
          top: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: color ?? Colors.red[600],
            ),
            constraints: const BoxConstraints(maxWidth: 25, minHeight: 16),
            child: Text(
              total.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 8),
            ),
          ),
        )
      ],
    );
  }
}
