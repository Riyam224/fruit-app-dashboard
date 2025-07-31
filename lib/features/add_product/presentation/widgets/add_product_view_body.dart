import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/custom_widgets/custom_btn.dart';
import 'package:fruit_dashboard/core/custom_widgets/custom_text_field.dart';
import 'package:fruit_dashboard/core/custom_widgets/is_featured_product_checkbox.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
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

  late String productName;
  late num productPrice;
  late String productCode;
  File? fileImage;
  late String productDescription;
  bool isFeaturedProduct = false;

  void _handleImagePicked(File? image) {
    setState(() {
      fileImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                hintText: 'add product',
                textInputType: TextInputType.text,
                onSaved: (value) {
                  productName = value!;
                },
              ),

              SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'product price',
                textInputType: TextInputType.text,
                onSaved: (value) {
                  productPrice = num.parse(value!);
                },
              ),

              SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'product code',
                textInputType: TextInputType.text,
                onSaved: (value) {
                  productCode = value!.toLowerCase();
                },
              ),

              SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'product description',
                textInputType: TextInputType.text,
                maxLines: 5,
                onSaved: (value) {
                  productDescription = value!;
                },
              ),
              SizedBox(height: 20),
              IsFeaturedProduct(
                onChanged: (value) {
                  isFeaturedProduct = value;
                },
              ),
              SizedBox(height: 20),
              ImageProduct(onImagePicked: _handleImagePicked),
              SizedBox(height: 16),
              CustomBtn(
                color: Colors.green,
                text: 'Add Product',
                onTap: () {
                  if (fileImage != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      AddProductInputEntity input = AddProductInputEntity(
                        name: productName,
                        code: productCode,
                        description: productDescription,
                        price: productPrice,
                        image: fileImage!,
                        isFeatured: isFeaturedProduct,
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  } else {
                    showError(context, 'Please select an image');
                  }
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
