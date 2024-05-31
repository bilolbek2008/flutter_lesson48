import 'package:flutter/material.dart';
import 'package:uyishi_31_05/controllers/settings_controller.dart';
import 'package:uyishi_31_05/views/screens/setting_screen.dart';
class HomePage extends StatelessWidget {
  final SettingsController settingsController;

  HomePage(this.settingsController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: settingsController.appBarColor,
        title: Text('Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert_outlined),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            AppBar(
              backgroundColor: settingsController.appBarColor,
              title: Text("Manu"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Sozlamalar'),
              trailing: Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsPage(settingsController)),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: settingsController.appBarColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "ona dada aka uka opa singil Ozbekiston olma anor nok dars kitob qizil yashil ruchka telefon sichqon devor din dindor maslahat ruchka qalb",
                      style: TextStyle(
                        fontSize: settingsController.bodyTextSize,
                        color: settingsController.bodyTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
