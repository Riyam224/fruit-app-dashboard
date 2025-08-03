// // payment method
import 'package:fruit_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruit_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruit_dashboard/features/orders/domain/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String orderId;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.orderId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  /// Convert OrderModel to Domain Entity
  toEntity() {
    return OrderEntity(
      totalPrice: totalPrice,
      uId: uId,
      shippingAddressModel: shippingAddressModel.toEntity(),
      orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
      paymentMethod: paymentMethod,
    );
  }
}
