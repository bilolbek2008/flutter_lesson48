import 'package:flutter/material.dart';
import 'package:uyishi_31_05/controllers/settings_controller.dart' as controller;
import 'package:uyishi_31_05/model/setting_model.dart' as model;
import 'package:uyishi_31_05/views/widgets/custom_drawer.dart';
import 'package:uyishi_31_05/utils/app_constants.dart';

class SettingsPage extends StatefulWidget {
  final controller.SettingsController settingsController;

  SettingsPage(this.settingsController);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _isDarkMode;
  late Color _appBarColor;
  late double _bodyTextSize;
  late Color _bodyTextColor;
  late String _pinCode;
  final TextEditingController _textSizeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.settingsController.isDarkMode;
    _appBarColor = widget.settingsController.appBarColor;
    _bodyTextSize = widget.settingsController.bodyTextSize;
    _bodyTextColor = widget.settingsController.bodyTextColor;
    _pinCode = widget.settingsController.pinCode;
    _textSizeController.text = _bodyTextSize.toString();
  }

  void _updateSettings() {
    widget.settingsController.updateSettings(
      model.SettingsModel(
        isDarkMode: _isDarkMode,
        appBarColor: _appBarColor.value,
        bodyTextSize: _bodyTextSize,
        bodyTextColor: _bodyTextColor.value,
        pinCode: _pinCode,
      ),
    );
    setState(() {
      AppConstants.themeMode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _saveTextSize() {
    setState(() {
      _bodyTextSize = double.tryParse(_textSizeController.text) ?? _bodyTextSize;
      _updateSettings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sozlamalar'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          ListTile(
            title: Text('AppBar rangi'),
            trailing: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: _appBarColor,
              ),
              child: GestureDetector(
                onTap: () async {
                  Color? selectedColor = await showDialog(
                    context: context,
                    builder: (context) =>
                        ColorPickerDialog(initialColor: _appBarColor),
                  );
                  if (selectedColor != null) {
                    setState(() {
                      _appBarColor = selectedColor;
                      _updateSettings();
                    });
                  }
                },
              ),
            ),
          ),
          ListTile(
            title: Text('Text rangi'),
            trailing: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: _bodyTextColor,
              ),
              child: GestureDetector(
                onTap: () async {
                  Color? selectedColor = await showDialog(
                    context: context,
                    builder: (context) =>
                        ColorPickerDialog(initialColor: _bodyTextColor),
                  );
                  if (selectedColor != null) {
                    setState(() {
                      _bodyTextColor = selectedColor;
                      _updateSettings();
                    });
                  }
                },
              ),
            ),
          ),
          ListTile(
            title: Text('Text o\'lchami'),
            subtitle: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _textSizeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Text o\'lchamini kiriting',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _saveTextSize,
                  child: Text('Saqlash'),
                ),
              ],
            ),
          ),
          SwitchListTile(
            title: Text('Tungi holat'),
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() {
                _isDarkMode = value;
                _updateSettings();
              });
            },
          ),
        ],
      ),
    );
  }
}
