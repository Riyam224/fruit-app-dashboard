import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_dashboard/core/services/storage_service.dart';

class FireStorage implements StorageService {
  // Create a storage reference from our app
  final storageRef = FirebaseStorage.instance;
  @override
  Future<String> uploadFile(String file) {
    throw UnimplementedError();
  }
}
