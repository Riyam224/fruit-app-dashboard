// // payment method
import 'package:fruit_dashboard/core/enums/orders_enum.dart';
import 'package:fruit_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruit_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String orderId;
  final String? status;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.status,
    required this.orderId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json['totalPrice'],
      uId: json['uId'],
      status: json['status'],
      orderId: json['orderId'],
      shippingAddressModel: ShippingAddressModel.fromJson(
        json['shippingAddressModel'],
      ),
      orderProducts: List<OrderProductModel>.from(
        json['orderProducts'].map((x) => OrderProductModel.fromJson(x)),
      ),
      paymentMethod: json['paymentMethod'],
    );
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uId': uId,
      'orderId': orderId,
      'status': 'pending',
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }

  /// Convert OrderModel to Domain Entity
  toEntity() {
    return OrderEntity(
      totalPrice: totalPrice,
      uId: uId,
      status: fetchEnum(),
      shippingAddressModel: shippingAddressModel.toEntity(),
      orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
      paymentMethod: paymentMethod,
    );
  }

  OrdersEnum fetchEnum() {
    return OrdersEnum.values.firstWhere(
      (e) => e.toString().split('.').last == status,
      orElse: () => OrdersEnum.pending,
    );
  }
}
