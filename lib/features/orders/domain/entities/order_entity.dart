import 'package:fruit_dashboard/core/enums/orders_enum.dart';
import 'package:fruit_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_product_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final String orderId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final OrdersStatusEnum status;

  OrderEntity({
    required this.totalPrice,
    required this.orderId,
    required this.uId,
    required this.status,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  toJson() => {
    'totalPrice': totalPrice,
    'uId': uId,
    'orderId': orderId,
    'status': 'pending',
    'date': DateTime.now().toIso8601String(),
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };
}

// payment method
