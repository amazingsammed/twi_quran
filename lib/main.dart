import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';
import 'package:twi_quran/features/authentication/presentation/auth.dart';
import 'package:twi_quran/shared/network/network.dart';
import 'package:twi_quran/shared/theme/theme.dart';
import 'package:twi_quran/test.dart';
import 'package:upgrader/upgrader.dart';

import 'features/audio_player/twiaudioplayer.dart';
import 'features/home/controller/home_controller.dart';
import 'features/home/presentation/home.dart';
import 'features/home/presentation/master.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
Get.put(TwiAudioPlayer());
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Asante Twi Translation",
      themeMode: ThemeMode.system,
      theme: light,
      home: UpgradeAlert(
          showIgnore: false,
          child: const AuthPage()),
    );
  }
}


