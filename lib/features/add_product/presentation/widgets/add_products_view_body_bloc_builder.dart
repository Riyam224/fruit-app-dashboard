import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/custom_widgets/custom_progress_hud.dart';
import 'package:fruit_dashboard/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:fruit_dashboard/features/add_product/presentation/cubit/add_product_state.dart';
import 'package:fruit_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';

class AddProductsViewBodyBlocBuilder extends StatelessWidget {
  const AddProductsViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }

        if (state is AddProductSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('product added successfully')));
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddProductLoading,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
