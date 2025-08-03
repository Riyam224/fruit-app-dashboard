abstract class DatabaseService {
  // todo methods

  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  // todo service method for get user data ( fetch it )

  Future<void> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  });

  Future<bool> checkIfDataExist({
    required String path,
    required String documentId,
  });
}
