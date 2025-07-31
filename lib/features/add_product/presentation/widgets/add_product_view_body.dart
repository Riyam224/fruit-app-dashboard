// ignore_for_file: unused_local_variable

import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/custom_widgets/custom_btn.dart';
import 'package:fruit_dashboard/core/custom_widgets/custom_text_field.dart';
import 'package:fruit_dashboard/core/custom_widgets/is_featured_product_checkbox.dart';
import 'package:fruit_dashboard/core/custom_widgets/is_organic_checkbox.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/review_entity.dart';
import 'package:fruit_dashboard/features/add_product/presentation/cubit/add_product_cubit.dart';
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

  late String productName, productDescription, productCode;
  late num productPrice, expirationalMonths, numberOfCalories, unitAmount;
  File? fileImage;
  bool isFeaturedProduct = false;
  bool isOrganic = false;

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
                hintText: 'product expirational months',
                textInputType: TextInputType.text,
                onSaved: (value) {
                  expirationalMonths = num.parse(value!);
                },
              ),

              SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'product number of calories',
                textInputType: TextInputType.text,
                onSaved: (value) {
                  numberOfCalories = num.parse(value!);
                },
              ),

              SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'product unit amount',
                textInputType: TextInputType.text,
                onSaved: (value) {
                  unitAmount = num.parse(value!);
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
              // todo
              IsOrganicCheckbox(
                onChanged: (value) {
                  isOrganic = value;
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
                        reviews: [
                          ReviewEntity(
                            name: 'yoora',
                            image:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrK7HNIO6G8tY_LEXH6sVy-q2TR2R5Q3qK2w&s',
                            rating: 5,
                            date: DateTime.now().toIso8601String(),
                            reviewDescription: 'good',
                          ),
                        ],
                        name: productName,
                        code: productCode,
                        description: productDescription,
                        price: productPrice,
                        image: fileImage!,
                        isFeatured: isFeaturedProduct,
                        expirationalMonths: expirationalMonths.toInt(),
                        numberOfCalories: numberOfCalories.toInt(),
                        unitAmount: unitAmount.toInt(),
                        isOrganic: isOrganic,
                      );
                      // todo add cubit here _________________
                      context.read<AddProductCubit>().addProduct(input);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
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
