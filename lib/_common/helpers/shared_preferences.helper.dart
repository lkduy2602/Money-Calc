import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKeys {
  static const userName = 'USER_NAME';
  static const userAvatar = 'USER_AVATAR';
}

class SharedPreferencesHelper {
  SharedPreferencesHelper._();

  static SharedPreferences? _prefs;
  static Future<SharedPreferences> _instance() async {
    _prefs ??= await SharedPreferences.getInstance();

    return _prefs!;
  }

  static Future<String> getUserName() async {
    final prefs = await _instance();

    return prefs.getString(SharedPreferencesKeys.userName) ?? 'Khách';
  }

  static Future<void> setUserName(String value) async {
    final prefs = await _instance();

    await prefs.setString(SharedPreferencesKeys.userName, value);
  }

  static Future<String> getUserAvatar() async {
    final prefs = await _instance();

    return prefs.getString(SharedPreferencesKeys.userAvatar) ?? '';
  }

  static Future<void> setUserAvatar(String value) async {
    final prefs = await _instance();

    await prefs.setString(SharedPreferencesKeys.userAvatar, value);
  }
}
