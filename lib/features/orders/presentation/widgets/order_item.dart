// ignore_for_file: unnecessary_to_list_in_spreads

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/enums/orders_enum.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_dashboard/features/orders/presentation/widgets/order_action_button.dart';

class OrderItemCard extends StatelessWidget {
  final OrderEntity order;

  const OrderItemCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Order ID: ${order.orderId}',
            //   style: const TextStyle(fontWeight: FontWeight.bold),
            // ),
            const SizedBox(height: 8),
            Text('Total Price: \$${order.totalPrice.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            Text('Payment Method: ${order.paymentMethod}'),
            const SizedBox(height: 8),
            const Divider(),
            Text(
              'Shipping Info:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text('Name: ${order.shippingAddressModel.name}'),
            Text('Phone: ${order.shippingAddressModel.phone}'),
            Text('Email: ${order.shippingAddressModel.email}'),
            Text(
              'Address: ${order.shippingAddressModel.address}, '
              'Floor: ${order.shippingAddressModel.floor}, '
              'City: ${order.shippingAddressModel.city}',
            ),
            const Divider(height: 24),
            Text(
              'Products:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            //  todo orders status
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: order.status == OrdersStatusEnum.pending
                    ? Colors.yellow
                    : order.status == OrdersStatusEnum.accepted
                    ? Colors.green
                    : order.status == OrdersStatusEnum.delivered
                    ? Colors.blue
                    : Colors.redAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                order.status.name,
                style: const TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 12),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.orderProducts.length,
              itemBuilder: (context, index) {
                final product = order.orderProducts[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: product.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  title: Text(product.name),
                  subtitle: Text(
                    'Code: ${product.code} | Quantity: ${product.quantity} | Price: \$${product.price.toStringAsFixed(2)}',
                  ),
                  trailing: Text(
                    '\$${(product.price * product.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),
            // todo
            OrderActionButton(orderModel: order),
          ],
        ),
      ),
    );
  }
}
