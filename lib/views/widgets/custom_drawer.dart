// import 'package:flutter/material.dart';
// import 'package:uyishi_31_05/views/screens/home_screen.dart';
// import 'package:uyishi_31_05/views/screens/setting_screen.dart';

// class CustomDrawer extends StatelessWidget {
//   final ValueChanged<bool> onThemeModeChanged;
//   const CustomDrawer({
//     super.key,
//     required this.onThemeModeChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           AppBar(
//             automaticallyImplyLeading: false,
//             title: const Text("MENYU"),
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder: (ctx) {
//                     return HomeScreen(
//                       onThemeModeChanged: onThemeModeChanged,
//                     );
//                   },
//                 ),
//               );
//             },
//             leading: const Icon(Icons.home),
//             title: const Text("Bosh Sahifa"),
//             trailing: const Icon(
//               Icons.chevron_right_rounded,
//             ),
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder: (ctx) {
//                     return SettingsScreen(
//                       onThemeModeChanged: onThemeModeChanged,
//                     );
//                   },
//                 ),
//               );
//             },
//             leading: const Icon(Icons.settings),
//             title: const Text("Sozlamalar"),
//             trailing: const Icon(
//               Icons.chevron_right_rounded,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerDialog extends StatelessWidget {
  final Color initialColor;

  ColorPickerDialog({required this.initialColor});

  @override
  Widget build(BuildContext context) {
    Color selectedColor = initialColor;
    return AlertDialog(
      title: Text('Rang tanlash'),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: initialColor,
          onColorChanged: (Color color) {
            selectedColor = color;
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Bekor qilish'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Tanlash'),
          onPressed: () {
            Navigator.of(context).pop(selectedColor);
          },
        ),
      ],
    );
  }
}
