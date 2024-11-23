abstract class DatabaseServices {
  Future<void> addData(
      {String? documentId,
      required String path,
      required Map<String, dynamic> data});

  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId});

  Future<bool> checkisUserExist(
      {required String path, required String documentId});
}
