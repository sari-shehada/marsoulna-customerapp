import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService({
    required this.prefs,
  });

  static late SharedPreferencesService instance;
  SharedPreferences prefs;
  static Future<SharedPreferencesService> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    instance = SharedPreferencesService(prefs: prefs);
    return instance;
  }

  int? getInt(SharedPrefsKey key) {
    return prefs.getInt(key.toString());
  }

  Future<void> setInt(SharedPrefsKey key, int value) async {
    await prefs.setInt(key.toString(), value);
  }

  Future<bool> writeItem<T>({required Enum key, required T value}) async {
    try {
      if (value is bool) {
        return await prefs.setBool(key.toString(), value);
      }
      if (value is String) {
        return await prefs.setString(key.toString(), value);
      }
      if (value is int) {
        return await prefs.setInt(key.toString(), value);
      }
      if (value is double) {
        return await prefs.setDouble(key.toString(), value);
      }
      if (value is List<String>) {
        return await prefs.setStringList(key.toString(), value);
      }
      throw Exception(
          'Exception Occurred When Calling SharedPreferencesService -> writeItem() -> Data Type Not Supported');
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  dynamic readItem<T>({required Enum key}) {
    try {
      if (T == bool) {
        return prefs.getBool(key.toString());
      }
      if (T == String) {
        return prefs.getString(key.toString());
      }
      if (T == int) {
        return prefs.getInt(key.toString());
      }
      if (T == double) {
        return prefs.getDouble(key.toString());
      }
      if (T == List<String>) {
        return prefs.getStringList(key.toString());
      }
      throw Exception(
          'Exception Occurred When Calling SharedPreferencesService -> readItem() -> Data Type Not Supported');
    } catch (e) {
      //TODO: Review This Type Of Exceptions and Reread about flutter Exceptions
      log(e.toString());
      return false;
    }
  }
}

enum SharedPrefsKey {
  currentThemeMode,
}
