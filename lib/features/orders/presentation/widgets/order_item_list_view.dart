import 'package:flutter/material.dart';

import 'package:fruit_dashboard/features/orders/domain/order_entity.dart';
import 'package:fruit_dashboard/features/orders/presentation/widgets/order_item.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({super.key, required this.orderModel});
  final List<OrderEntity> orderModel;
/*************  ✨ Windsurf Command ⭐  *************/
  /// Builds a list view of [OrderItemCard]s from the given [orderModel].
  ///
/*******  cadddc3d-de73-4ef6-981a-96c04bdc6a96  *******/  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderModel.length,
      itemBuilder: (BuildContext context, int index) {
        return OrderItemCard(order: orderModel[index]);
      },
    );
  }
}
