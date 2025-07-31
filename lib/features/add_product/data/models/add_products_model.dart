import 'dart:io';

import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductsModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File? image;
  final bool isFeatured;
  String? imageUrl;

  AddProductsModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
  });

  factory AddProductsModel.fromEntity(AddProductInputEntity addProductsEntity) {
    return AddProductsModel(
      name: addProductsEntity.name,
      code: addProductsEntity.code,
      description: addProductsEntity.description,
      price: addProductsEntity.price,
      image: addProductsEntity.image,
      isFeatured: addProductsEntity.isFeatured,
      imageUrl: addProductsEntity.imageUrl,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      // todo no need to add image to firestore
      // 'image': image,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
    };
  }
}
