import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_dashboard/features/orders/domain/repos/orders_repo.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this.ordersRepo) : super(FetchOrdersInitial());
  final OrdersRepo ordersRepo;

  // todo  stream order
  StreamSubscription? _streamSubscription;
  void fetchOrders() {
    emit(FetchOrdersLoading());
    _streamSubscription = ordersRepo.fetchOrders().listen((result) {
      result.fold(
        (f) {
          emit(FetchOrdersFailure(f.message));
        },
        (r) {
          emit(FetchOrdersSuccess(orders: r));
        },
      );
    });
  }

  // todo dispose
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
