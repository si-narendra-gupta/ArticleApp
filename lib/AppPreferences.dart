import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {

  static final AppPreferences _instance = AppPreferences._internal();

  factory AppPreferences() {
    return _instance;
  }

  AppPreferences._internal();

  late final SharedPreferences _sharedPrefs;
  bool _initialized = false;
  Future<void> init() async {
    if(!_initialized) {
      _sharedPrefs = await SharedPreferences.getInstance();
      _initialized = true;
    }
  }


  // Getters and Setters for different data types
  String getString(String key,{String? defaultValue}) {
    return _sharedPrefs.getString(key) ?? defaultValue ?? "";
  }

  Future<bool> setString(String key, String value) {
    return _sharedPrefs.setString(key, value);
  }

  int getInt(String key, {int? defaultValue}) {
    return _sharedPrefs.getInt(key) ?? defaultValue ?? 0;
  }

  Future<bool> setInt(String key, int value) {
    return _sharedPrefs.setInt(key, value);
  }

  double getDouble(String key, {double? defaultValue}) {
    return _sharedPrefs.getDouble(key) ?? defaultValue ?? 0;
  }

  Future<bool> setDouble(String key, double value) {
    return _sharedPrefs.setDouble(key, value);
  }

  bool getBool(String key, {bool? defaultValue}) {
    return _sharedPrefs.getBool(key) ?? false;
  }

  Future<bool> setBool(String key, bool value) {
    return _sharedPrefs.setBool(key, value);
  }

  // Remove a key from SharedPreferences
  Future<bool> remove(String key) {
    return _sharedPrefs.remove(key);
  }

}