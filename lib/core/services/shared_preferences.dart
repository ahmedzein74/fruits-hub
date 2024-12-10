import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  static bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      return await _prefs.setInt(key, value);
    } else if (value is String) {
      return await _prefs.setString(key, value);
    } else if (value is double) {
      return await _prefs.setDouble(key, value);
    } else {
      return await _prefs.setBool(key, value);
    }
  }

  static dynamic getData({required String key}) {
    return _prefs.get(key);
  }
}
