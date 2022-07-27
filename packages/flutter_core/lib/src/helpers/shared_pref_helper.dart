import 'package:shared_preferences/shared_preferences.dart';

class SharePrefHelper {
  SharePrefHelper._();

  static SharePrefHelper get instance => SharePrefHelper._();

  Future<bool> setValue(dynamic value, {required String key}) async {
    if (value == null) {
      return false;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      return prefs.setString(key, value);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is bool) {
      return prefs.setBool(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    } else if (value is List<String>) {
      return prefs.setStringList(key, value);
    }
    return false;
  }

  Future getValue({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }
}
