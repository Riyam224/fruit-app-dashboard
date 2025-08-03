import 'dart:io';

import 'package:fruit_dashboard/features/add_product/data/models/review_model.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/products_entity.dart';

class ProductsModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File? image;
  final bool isFeatured;
  String? imageUrl;
  // todo additional data
  final num expirationalMonths;
  final bool isOrganic;
  final num numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final num unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductsModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.reviews,
    required this.image,
    required this.isFeatured,
    required this.expirationalMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    this.imageUrl,
    this.sellingCount = 0,
  });

  factory ProductsModel.fromEntity(ProductsEntity addProductsEntity) {
    return ProductsModel(
      reviews: addProductsEntity.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
      name: addProductsEntity.name,
      code: addProductsEntity.code,
      description: addProductsEntity.description,
      price: addProductsEntity.price,
      image: addProductsEntity.image,
      expirationalMonths: addProductsEntity.expirationalMonths,
      numberOfCalories: addProductsEntity.numberOfCalories,
      isOrganic: addProductsEntity.isOrganic,
      unitAmount: addProductsEntity.unitAmount,
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
      'expirationalMonths': expirationalMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'sellingCount': sellingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      // 'avgRating': avgRating,
      // 'ratingCount': ratingCount
    };
  }
}
