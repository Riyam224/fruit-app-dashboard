import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/enums/orders_enum.dart';
import 'package:fruit_dashboard/features/orders/domain/repos/orders_repo.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.ordersRepo) : super((UpdateOrderInitial()));

  final OrdersRepo ordersRepo;

  Future<void> updateOrder({
    required OrdersStatusEnum status,
    required String orderId,
  }) async {
    emit(UpdateOrderLoading());
    final result = await ordersRepo.updateOrder(
      status: status,
      orderId: orderId,
    );
    result.fold(
      (f) {
        emit(UpdateOrderFailure(f.message));
      },
      (r) {
        emit(UpdateOrderSuccess());
      },
    );
  }
}
