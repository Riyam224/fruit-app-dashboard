import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failure.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/products_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProduct(
    ProductsEntity addProductInputEntity,
  );
}
