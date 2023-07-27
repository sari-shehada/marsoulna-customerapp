import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService({
    required this.prefs,
  });

  static late SharedPreferencesService instance;
  static bool _isInitialized = false;
  SharedPreferences prefs;
  static Future<SharedPreferencesService> init() async {
    if (_isInitialized) return instance;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    instance = SharedPreferencesService(prefs: prefs);
    _isInitialized = true;
    return instance;
  }

  Future<bool> setValue<T>({required Enum key, required T value}) async {
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

  T? getValue<T>({required Enum key}) {
    try {
      if (T == bool) {
        return prefs.getBool(key.toString()) as T?;
      }
      if (T == String) {
        return prefs.getString(key.toString()) as T?;
      }
      if (T == int) {
        return prefs.getInt(key.toString()) as T?;
      }
      if (T == double) {
        return prefs.getDouble(key.toString()) as T?;
      }
      if (T == List<String>) {
        return prefs.getStringList(key.toString()) as T?;
      }
      throw Exception(
          'Exception Occurred When Calling SharedPreferencesService -> readItem() -> Data Type Not Supported');
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> clearAll() async {
    try {
      bool clearingRes = await prefs.clear();
      if (clearingRes) {
        log('SharedPreferencesService -> clearAll() -> Clear Shared Preferences Succeeded');
      } else {
        log('SharedPreferencesService -> clearAll() -> Clear Shared Preferences Failed With An Exception');
      }
      return clearingRes;
    } catch (e) {
      log('SharedPreferencesService -> clearAll() -> Clear Shared Preferences Failed With An Exception');
      return false;
    }
  }

  Future<bool> clearValue({required Enum key}) async {
    try {
      if (!keyExists(key: key)) {
        throw Exception('Cannot Clear A Non Existing Key: "${key.toString()}"');
      }
      bool clearingRes = await prefs.remove(key.toString());
      if (clearingRes) {
        log('SharedPreferencesService -> clearValue() -> Clear Shared Preferences Succeeded');
      } else {
        log('SharedPreferencesService -> clearValue() -> Clear Shared Preferences Failed With An Exception');
      }
      return clearingRes;
    } catch (e) {
      log('SharedPreferencesService -> clearValue() -> Clear Shared Preferences Failed With An Exception');
      return false;
    }
  }

  bool keyExists({required Enum key}) {
    try {
      bool keyFound = prefs.containsKey(key.toString());
      if (!keyFound) {
        log('SharedPreferencesService -> keyExists() -> No Existing Item With Key: $key');
      }
      return keyFound;
    } catch (e) {
      log('SharedPreferencesService -> keyExists() -> Failed With An Exception');
      return false;
    }
  }
}
