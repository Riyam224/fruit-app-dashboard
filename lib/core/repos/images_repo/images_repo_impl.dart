import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failure.dart';
import 'package:fruit_dashboard/core/repos/images_repo/images_repo.dart';

class ImagesRepoImpl extends ImagesRepo {
  @override
  Future<Either<Failure, String>> uploadImage(File image) {
    throw UnimplementedError();
  }
}
