import 'package:fruit_dashboard/core/enums/orders_enum.dart';
import 'package:fruit_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

OrderEntity getDummyOrders() {
  // 1. Create a shipping address entity
  ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity(
    name: 'John Doe',
    phone: '123-456-7890',
    address: '123 Main St',
    floor: '5th Floor',
    city: 'New York',
    email: 'johndoe@example.com',
  );

  // 2. Convert entity to model
  ShippingAddressModel shippingAddressModel = ShippingAddressModel.fromEntity(
    shippingAddressEntity,
  );

  // 3. Create a sample list of order products
  List<OrderProductEntity> orderProducts = [
    OrderProductEntity(
      name: 'Product A',
      code: 'A123',
      imageUrl: 'https://via.placeholder.com/150',
      price: 49.99,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'Product B',
      code: 'B456',
      imageUrl: 'https://via.placeholder.com/150',
      price: 29.99,
      quantity: 1,
    ),
  ];

  // 4. Calculate total price
  double totalPrice = orderProducts.fold(
    0.0,
    (sum, item) => sum + (item.price * item.quantity),
  );

  // 5. Return a dummy OrderEntity
  return OrderEntity(
    orderId: 'sample_order_id_001',
    totalPrice: totalPrice,
    uId: 'sample_user_001',
    status: OrdersStatusEnum.pending,
    shippingAddressModel: shippingAddressModel,
    orderProducts: orderProducts,
    paymentMethod: 'Cash',
  );
}
