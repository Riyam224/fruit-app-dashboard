import 'package:flutter/material.dart';

import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_dashboard/features/orders/presentation/widgets/filter_section.dart';

import 'package:fruit_dashboard/features/orders/presentation/widgets/order_item_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          SizedBox(height: 20),
          FilterSection(),
          SizedBox(height: 20),
          Expanded(child: OrderItemListView(orderModel: orders)),
        ],
      ),
    );
  }
}
