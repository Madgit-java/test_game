
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../service/music.dart';
import '../widgets/card_settings_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/container_gradient.dart';

class Settings extends StatefulWidget {
  const Settings({super.key,});

  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {

  bool notificationsEnabled = false;
  @override
  void initState() {
    super.initState();
    loadNotificationStatus();
  }

  Future<void> loadNotificationStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      notificationsEnabled = prefs.getBool('notificationsEnabled') ?? false;
    });
  }

  Future<void> saveNotificationStatus(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notificationsEnabled', value);
    if (value) {
      Music.instance.playMusic();
    } else {
      Music.instance.stopMusic();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ContainerGradient(
          child:  Stack(alignment: Alignment.center,
            children: [
              Positioned(left: 28,
                  top: 44,
                  child: GestureDetector(onTap: (){Navigator.of(context).pop();},
                      child: Image.asset('assets/back.png',))),
              Positioned(top: 128,left: 40, right: 40,
                child: CardSettingsWidget(widget:
                CupertinoSwitch(
                  activeColor: Colors.greenAccent,
                  thumbColor: const Color(0xFF878484),
                  trackColor: const Color(0xFFD9D9D9),
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                    saveNotificationStatus(value);
                  },
                ),),
              ),
            ],
          ),
        ));
  }
}