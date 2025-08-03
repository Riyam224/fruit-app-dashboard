import 'package:flutter/material.dart';
import 'package:fruit_dashboard/features/orders/presentation/widgets/orders_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrdersViewBody());
  }
}
