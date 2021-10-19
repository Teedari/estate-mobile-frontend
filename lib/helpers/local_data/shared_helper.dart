import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static var pref = SharedPreferences.getInstance();

  static setLocalData(String key, String val) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(key, val);
  }

  static Future<String> getLocalData(String key) async {
    var pref = await SharedPreferences.getInstance();
    try {
      return pref.getString(key)!;
    } catch (e) {
      return '';
    }
  }

  static Future<bool> removeLocalData(String key) async {
    var pref = await SharedPreferences.getInstance();
    try {
      return pref.remove(key);
    } catch (e) {
      return false;
    }
  }
}
