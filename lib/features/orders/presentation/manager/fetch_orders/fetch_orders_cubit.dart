import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_dashboard/features/orders/domain/repos/orders_repo.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this.ordersRepo) : super(FetchOrdersInitial());
  final OrdersRepo ordersRepo;

  Future<void> fetchOrders() async {
    emit(FetchOrdersLoading());
    final result = await ordersRepo.fetchOrders();
    result.fold(
      (l) => emit(FetchOrdersFailure(l.message)),
      (r) => emit(FetchOrdersSuccess(r)),
    );
  }
}
