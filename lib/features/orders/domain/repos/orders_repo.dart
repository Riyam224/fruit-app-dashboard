import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/enums/orders_enum.dart';
import 'package:fruit_dashboard/core/errors/failure.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders(); // ✅ fixed signature

  Future<Either<Failure, void>> updateOrder({
    required OrdersStatusEnum status,
    required String orderId,
  });
}
