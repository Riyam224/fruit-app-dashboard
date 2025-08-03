// ignore_for_file: unused_field, unused_local_variable
import 'dart:io';
import 'package:fruit_dashboard/core/services/storage_service.dart';
import 'package:fruit_dashboard/core/utils/constants.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  //  todo create bucket
  static createBuckets(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();
    bool isBucketExits = false;
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExits = true;
      }
    }
    if (!isBucketExits) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  // todo initilize supabase

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

  // todo upload file
  @override
  Future<String> uploadFile(File file, String path) async {
    try {
      String fileName = p.basename(file.path);
      String extensionName = p.extension(file.path);
      // todo upload
      var result = await _supabase.client.storage
          .from('fruits_images')
          .upload('$path/$fileName.$extensionName', file);
      // todo get public urlon
      final String publicUrl = _supabase.client.storage
          .from('fruits_images')
          .getPublicUrl('$path/$fileName.$extensionName');

      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
