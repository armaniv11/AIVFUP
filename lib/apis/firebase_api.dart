import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseApi {
  // final FirebaseFirestore
  static final FirebaseFirestore firebase = FirebaseFirestore.instance;
  static Future<QuerySnapshot> loadCollection(String collectionName) async {
    return await firebase.collection(collectionName).get();
  }

  static Future<bool> upsertDocToCollection(
      {required String doc,
      required String collection,
      required modelToUpload}) async {
    try {
      return await firebase
          .collection(collection)
          .doc(doc)
          .set(modelToUpload.toJson())
          .then((value) {
        return true;
      });
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
