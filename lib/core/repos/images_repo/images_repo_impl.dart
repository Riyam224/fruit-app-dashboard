import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failure.dart';
import 'package:fruit_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_dashboard/core/services/storage_service.dart';
import 'package:fruit_dashboard/core/utils/backend_endpoints.dart';

class ImagesRepoImpl extends ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl(this.storageService);

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await storageService.uploadFile(
        image,
        BackendEndpoints.images,
      );
      return Right(url);
    } catch (e) {
      return Left(ServerFailure('failed to  upload image'));
    }
  }
}
