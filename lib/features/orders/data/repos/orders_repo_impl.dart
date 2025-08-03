// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/enums/orders_enum.dart';
import 'package:fruit_dashboard/core/errors/failure.dart';
import 'package:fruit_dashboard/core/services/database_service.dart';
import 'package:fruit_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruit_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_dashboard/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  // todo
  final DatabaseService _databaseService;
  OrdersRepoImpl(this._databaseService);

  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var data in _databaseService.streamData(
        path: BackendEndpoints.getOrders,
      )) {
        List<OrderEntity> orders = (data as List<dynamic>)
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrder({
    required OrdersStatusEnum status,
    required String orderId,
  }) async {
    try {
      await _databaseService.updateData(
        data: {'status': status.name},
        path: BackendEndpoints.updateOrder,
        documentId: orderId,
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
