import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/services/database_services.dart';

class FireStoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Adds data to a Firestore collection.
  // If a document ID is provided, it updates that document, else it adds a new one.
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore
          .collection(path)
          .doc(documentId)
          .set(data); // Update document by ID
    } else {
      await firestore.collection(path).add(data); // Add new document
    }
  }

  // Fetches data from a specific Firestore document.
  // Returns the data as a Map.
  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId}) async {
    var data = await firestore
        .collection(path)
        .doc(documentId)
        .get(); // Get the document
    return data.data() as Map<String, dynamic>; // Return the document data
  }

  // Checks if a document exists in Firestore.
  // Returns true if the document exists, false otherwise.
  @override
  Future<bool> checkisUserExist(
      {required String path, required String documentId}) async {
    var data = await firestore
        .collection(path)
        .doc(documentId)
        .get(); // Fetch document
    return data.exists; //return exists data
  }
}
