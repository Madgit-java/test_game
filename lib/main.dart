import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_game/pages/home.dart';
import 'package:test_game/service/music.dart';

import 'bloc/image/bloc.dart';

void main() {
  runApp(const MyApp());
  loadNotificationStatus();
}

bool notificationsEnabled = false;

Future<void> loadNotificationStatus() async {
  final prefs = await SharedPreferences.getInstance();
  notificationsEnabled = prefs.getBool('notificationsEnabled') ?? false;
  if (notificationsEnabled) {
    Music.instance.playMusic();
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageBloc(),
      child: MaterialApp(
        debugShowMaterialGrid: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

