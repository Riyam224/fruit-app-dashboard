import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/custom_widgets/get_orders_dummy_data.dart';
import 'package:fruit_dashboard/features/orders/presentation/widgets/filter_section.dart';

import 'package:fruit_dashboard/features/orders/presentation/widgets/order_item_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          SizedBox(height: 20),
          FilterSection(),
          SizedBox(height: 20),
          Expanded(
            child: OrderItemListView(
              orderModel: [
                getDummyOrders(),
                getDummyOrders(),
                getDummyOrders(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
