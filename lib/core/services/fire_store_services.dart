import 'package:fruits_hub/core/services/database_services.dart';

class FireStoreServices implements DatabaseServices {
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) {
    throw UnimplementedError();
  }
}
