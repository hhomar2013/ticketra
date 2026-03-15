import 'package:shared_preferences/shared_preferences.dart';

//   shared_preferences: ^2.2.2
class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    // starting point
    sharedPreferences = await SharedPreferences.getInstance(); // create file
  }

  static Future<bool> putData({
    // saving
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  static Future<dynamic> saveData({
    // saving Data
    required String key,
    required String value,
  }) async {
    return await sharedPreferences.setString(key, value);
  }

  static Future<dynamic> saveInt({
    // saving Data
    required String key,
    required int value,
  }) async {
    return await sharedPreferences.setInt(key, value);
  }

  static bool getData({
    // getting data
    required String key,
  }) {
    return sharedPreferences.getBool(key) ?? false;
  }

  static String getData2({
    // getting data
    required String key,
  }) {
    return sharedPreferences.getString(key) ?? '';
  }

  static int getIntData({required String key}) {
    return sharedPreferences.getInt(key) ?? 0;
  }

  static Future<bool> removeData({
    // removing data
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }
}
