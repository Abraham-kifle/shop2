import 'package:flutter/material.dart';
import '../providers/orders.dart' show Orders;
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderDate = Provider.of<Orders>(context);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: orderDate.orders.length,
            itemBuilder: (context, i) {
              return OrderItem(orderDate.orders[i]);
            },
          ),
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Make Payment')),
      ],
    );
  }
}
