import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/custom_widgets/custom_appbar.dart';
import 'package:fruit_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruit_dashboard/core/services/get_it_service.dart';
import 'package:fruit_dashboard/features/add_product/presentation/cubit/add_product_cubit.dart';

import 'package:fruit_dashboard/features/add_product/presentation/widgets/add_products_view_body_bloc_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomAppbar(text: 'add product')),
      body: BlocProvider(
        create: (context) =>
            AddProductCubit(getIt.get<ImagesRepo>(), getIt.get<ProductsRepo>()),
        child: AddProductsViewBodyBlocBuilder(),
      ),
    );
  }
}
