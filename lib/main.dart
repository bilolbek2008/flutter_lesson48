import 'package:flutter/material.dart';

import 'package:uyishi_31_05/views/screens/home_screen.dart';
import 'controllers/settings_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SettingsController settingsController = SettingsController();
  await settingsController.loadSettings();
  runApp(MyApp(settingsController));
}

class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  MyApp(this.settingsController);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: settingsController.isDarkMode
              ? ThemeData.dark()
              : ThemeData.light(),
          home: HomePage(settingsController),
        );
      },
    );
  }
}
