import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failure.dart';
import 'package:fruit_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruit_dashboard/core/services/database_service.dart';
import 'package:fruit_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruit_dashboard/features/add_product/data/models/add_products_model.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  // todo

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) async {
    try {
      await databaseService.addData(
        path: BackendEndpoints.addProducts,
        data: AddProductsModel.fromEntity(addProductInputEntity).toJson(),
      );

      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
