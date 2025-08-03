import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/custom_widgets/get_orders_dummy_data.dart';
import 'package:fruit_dashboard/core/services/get_it_service.dart';
import 'package:fruit_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:fruit_dashboard/features/orders/presentation/manager/fetch_orders/fetch_orders_cubit.dart';
import 'package:fruit_dashboard/features/orders/presentation/manager/update_order/update_order_cubit.dart';
import 'package:fruit_dashboard/features/orders/presentation/widgets/orders_view_body.dart';
import 'package:fruit_dashboard/features/orders/presentation/widgets/update_order_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchOrdersCubit(getIt.get<OrdersRepo>()),
        ),
        BlocProvider(
          create: (context) => UpdateOrderCubit(getIt.get<OrdersRepo>()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('Orders')),
        body: UpdateOrderBuilder(child: OrdersViewBodyBuilder()),
      ),
    );
  }
}

// todo OrdersViewBodyBuilder

class OrdersViewBodyBuilder extends StatefulWidget {
  const OrdersViewBodyBuilder({super.key});

  @override
  State<OrdersViewBodyBuilder> createState() => _OrdersViewBodyBuilderState();
}

class _OrdersViewBodyBuilderState extends State<OrdersViewBodyBuilder> {
  @override
  void initState() {
    context.read<FetchOrdersCubit>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrdersViewBody(orders: state.orders);
        } else if (state is FetchOrdersFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Skeletonizer(
            child: OrdersViewBody(orders: [getDummyOrders(), getDummyOrders()]),
          );
        }
      },
    );
  }
}
