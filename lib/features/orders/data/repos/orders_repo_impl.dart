// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
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
  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
      final data = await _databaseService.getData(
        path: BackendEndpoints.getOrders,
      );
      List<OrderEntity> orders = (data as List<dynamic>)
          .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
          .toList();

      return Right(orders);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
