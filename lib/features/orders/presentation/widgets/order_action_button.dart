import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/enums/orders_enum.dart';
import 'package:fruit_dashboard/features/orders/presentation/manager/update_order/update_order_cubit.dart';
import '../../domain/entities/order_entity.dart';

class OrderActionButton extends StatelessWidget {
  const OrderActionButton({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: orderEntity.status == OrdersStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {
              // todo
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrdersStatusEnum.accepted,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text("Accept"),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrdersStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrdersStatusEnum.canceled,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text("Reject"),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrdersStatusEnum.accepted,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrdersStatusEnum.delivered,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text("Deliver"),
          ),
        ),
      ],
    );
  }
}
