import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as p;

class FireStorage implements StorageService {
  // Create a storage reference from our app
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = p.basename(file.path);
    String extensionName = p.extension(file.path);

    var fileReference = storageRef.child("$path/$fileName.$extensionName");
    await fileReference.putFile(file);
    var fileUrl = fileReference.getDownloadURL();
    return fileUrl;
  }
}
