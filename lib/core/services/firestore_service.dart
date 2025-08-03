// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fruit_dashboard/core/services/database_service.dart';

// class FirestoreService implements DatabaseService {
//   // todo
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   @override
//   Future<void> addData({
//     required String path,
//     required Map<String, dynamic> data,
//     String? documentId,
//   }) async {
//     if (documentId != null) {
//       await firestore.collection(path).doc(documentId).set(data);
//     } else {
//       // todo do the impl with firestore to save auth data and store it
//       //  in collections and if there is another servive use it
//       await firestore.collection(path).add(data);
//     }
//   }

//   @override
//   Future<Map<String, dynamic>> getData({
//     required String path,
//     required String documentId,
//   }) async {
//     var data = await firestore.collection(path).doc(documentId).get();
//     return data.data() as Map<String, dynamic>;
//   }

//   @override
//   Future<bool> checkIfDataExist({
//     required String path,
//     required String documentId,
//   }) async {
//     var data = await firestore.collection(path).doc(documentId).get();
//     return data.exists;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_dashboard/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  // todo
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      // todo do the impl with firestore to save auth data and store it
      //  in collections and if there is another servive use it
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      // todo filter the best selling products
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var isDescending = query['descending'];
          data = data.orderBy(orderByField, descending: isDescending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExist({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
