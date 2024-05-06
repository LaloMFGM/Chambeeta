import 'package:chambeeta/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key});

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  double containerHeight = 200;
  double avatarRadius = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          Container(
            width: double.infinity,
            height: containerHeight,
            color: accentColor,
          ),
          Positioned(
            top: containerHeight - avatarRadius,
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundImage: AssetImage(userImg),
            ),
          ),
        ]),
        SizedBox(height: avatarRadius * 4 / 3),
        Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Lalo MFGM',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Calificación : 4.5',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 5), // Espacio entre el icono y el texto
                Icon(Icons.star, color: Colors.yellow, size: 20),
              ],
            )
          ],
        )
      ]),
    );
  }
}
