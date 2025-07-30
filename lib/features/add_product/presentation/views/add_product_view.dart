import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/custom_widgets/custom_appbar.dart';
import 'package:fruit_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomAppbar(text: 'add product')),
      body: AddProductViewBody(),
    );
  }
}
