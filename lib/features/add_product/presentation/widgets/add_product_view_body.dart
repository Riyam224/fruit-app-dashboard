import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/custom_widgets/custom_text_field.dart';
import 'package:fruit_dashboard/features/add_product/presentation/widgets/image_product.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  // todo
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'add product',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'product description',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'product price',
                textInputType: TextInputType.text,
              ),

              SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'product code',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 20),
              ImageProduct(
                onImagePicked: (file) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
