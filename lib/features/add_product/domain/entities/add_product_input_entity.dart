import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  // todo additional data
  final num expirationalMonths;
  final bool isOrganic;
  final num numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final num unitAmount;

  AddProductInputEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.expirationalMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    this.imageUrl,
  });
}
