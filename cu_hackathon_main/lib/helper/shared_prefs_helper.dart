import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const String _keyEmail = 'email';
  static const String _defaultEmail = 'a@gmail.com';

  // Save email to SharedPreferences
  static Future<void> saveEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEmail, email);
  }

  // Get email from SharedPreferences
  static Future<String?> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail);
  }

  // Remove email from SharedPreferences
  static Future<void> removeEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyEmail);
  }
}
