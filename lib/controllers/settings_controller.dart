import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uyishi_31_05/model/setting_model.dart';

class SettingsController with ChangeNotifier {
  SettingsModel _settings = SettingsModel(
    isDarkMode: false,
    appBarColor: Colors.blue.value,
    bodyTextSize: 10.0,
    bodyTextColor: Colors.black.value,
    pinCode: '',
  );

  SettingsModel get settings => _settings;

  bool get isDarkMode => _settings.isDarkMode;
  Color get appBarColor => Color(_settings.appBarColor);
  double get bodyTextSize => _settings.bodyTextSize;
  Color get bodyTextColor => Color(_settings.bodyTextColor);
  String get pinCode => _settings.pinCode;

  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _settings = SettingsModel(
      isDarkMode: prefs.getBool('isDarkMode') ?? false,
      appBarColor: prefs.getInt('appBarColor') ?? Colors.blue.value,
      bodyTextSize: prefs.getDouble('bodyTextSize') ?? 16.0,
      bodyTextColor: prefs.getInt('bodyTextColor') ?? Colors.black.value,
      pinCode: prefs.getString('pinCode') ?? '',
    );
    notifyListeners();
  }

  Future<void> saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _settings.isDarkMode);
    await prefs.setInt('appBarColor', _settings.appBarColor);
    await prefs.setDouble('bodyTextSize', _settings.bodyTextSize);
    await prefs.setInt('bodyTextColor', _settings.bodyTextColor);
    await prefs.setString('pinCode', _settings.pinCode);
  }

  void updateSettings(SettingsModel newSettings) {
    _settings = newSettings;
    saveSettings();
    notifyListeners();
  }
}
