import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_dashboard/features/add_product/presentation/cubit/add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
    : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    // todo upload image
    var resutl = await imagesRepo.uploadImage(addProductInputEntity.image);

    resutl.fold(
      (failure) {
        emit(AddProductError(failure.message));
      },
      (imageUrl) async {
        addProductInputEntity.imageUrl = imageUrl;

        //  todo add product
        var resutl = await productsRepo.addProduct(addProductInputEntity);
        resutl.fold(
          (failure) {
            emit(AddProductError(failure.message));
          },
          (result) {
            emit(AddProductSuccess());
          },
        );

        productsRepo.addProduct(addProductInputEntity);
        emit(AddProductSuccess());
      },
    );
  }
}
