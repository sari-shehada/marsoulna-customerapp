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
}

enum SharedPrefsKey {
  currentThemeMode,
}
