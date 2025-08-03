// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';

import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_dashboard/features/orders/presentation/widgets/order_item.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({super.key, required this.orderModel});
  final List<OrderEntity> orderModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderModel.length,
      itemBuilder: (BuildContext context, int index) {
        return OrderItemCard(order: orderModel[index]);
      },
    );
  }
}
