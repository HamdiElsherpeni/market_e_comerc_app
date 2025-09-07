import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  static const String _tokenKey = 'auth_token';
  static const String _emialKey = 'email';

  static const String _userNameKey = 'user_name';
  static const String _userId = 'user_id';
  static const String _localeKey = 'app_locale';
  static const String _themeKey = 'app_theme';
  static const String _gender = 'gender';
  static const String _type = 'type';
  static const String _address = 'adress';
  static const String _phone = 'phone';

  static Future<void> savePhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_phone, phone);
    print('[DEBUG] Saved email: $phone');
  }

  static Future<String?> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    final phone = prefs.getString(_phone);
    print('[DEBUG] Loaded email: $phone');
    return phone;
  }

  static Future<void> clearPhone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_phone);
  }

  static Future<void> saveType(String type) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_type, type);
    print('[DEBUG] Saved email: $type');
  }

  static Future<String?> getType() async {
    final prefs = await SharedPreferences.getInstance();
    final type = prefs.getString(_type);
    print('[DEBUG] Loaded email: $type');
    return type;
  }

  static Future<void> clearType() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_type);
  }

  static Future<void> saveGender(String gender) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_gender, gender);
    print('[DEBUG] Saved email: $gender');
  }

  static Future<String?> getGender() async {
    final prefs = await SharedPreferences.getInstance();
    final gender = prefs.getString(_gender);
    print('[DEBUG] Loaded email: $gender');
    return gender;
  }

  static Future<void> clearGender() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_gender);
  }

  static Future<void> saveAddress(String address) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_address, address);
    print('[DEBUG] Saved email: $address');
  }

  static Future<String?> getAdress() async {
    final prefs = await SharedPreferences.getInstance();
    final address = prefs.getString(_address);
    print('[DEBUG] Loaded email: $address');
    return address;
  }

  static Future<void> clearAdress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_address);
  }

  static Future<void> saveUserName(String userName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, userName);
    print('[DEBUG] Saved user name: $userName');
  }

  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    final userName = prefs.getString(_userNameKey);
    print('[DEBUG] Loaded user name: $userName');
    return userName;
  }

  static Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emialKey, email);
    print('[DEBUG] Saved email: $email');
  }

  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(_emialKey);
    print('[DEBUG] Loaded email: $email');
    return email;
  }

  static Future<void> clearEmail() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_emialKey);
  }

  static Future<void> clearUserName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userNameKey);
  }

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    print('[DEBUG] Saved token: $token');
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    print('[DEBUG] Loaded token: $token');
    return token;
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  static Future<void> saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    print('[DEBUG] Saved name: $name');
  }

  static Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    print('[DEBUG] Loaded name: $name');
    return name;
  }

  static Future<void> clearName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
  }

  static Future<void> setLocale(String locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale);
  }

  static Future<String?> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_localeKey);
  }

  static Future<void> setTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, theme);
  }

  static Future<String?> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey);
  }
}
