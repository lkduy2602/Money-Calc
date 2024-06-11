import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const _userName = 'USER_NAME';
  static const _userAvatar = 'USER_AVATAR';

  SharedPreferencesHelper._();

  static SharedPreferences? _prefs;
  static Future<SharedPreferences> _instance() async {
    _prefs ??= await SharedPreferences.getInstance();

    return _prefs!;
  }

  static Future<String> getUserName() async {
    final prefs = await _instance();

    return prefs.getString(_userName) ?? 'Khách';
  }

  static Future<void> setUserName(String value) async {
    final prefs = await _instance();

    await prefs.setString(_userName, value);
  }

  static Future<String> getUserAvatar() async {
    final prefs = await _instance();

    return prefs.getString(_userAvatar) ?? '';
  }

  static Future<void> setUserAvatar(String value) async {
    final prefs = await _instance();

    await prefs.setString(_userAvatar, value);
  }
}
