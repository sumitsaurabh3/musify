
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:spotify_clone/premiumscreen/premiumScreen.dart';
import 'package:spotify_clone/searchscreen/searchscreen.dart';
import 'package:spotify_clone/utils/notify.dart';

import 'home/homepage.dart';
import 'libraryscreen/libraryScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Notify notify = Get.put(Notify());
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/search': (context) => const SearchScreen(),
        '/library': (context) => const LibraryScreen(),
        '/premium' : (context) => const PremiumScreen(),
      },
    );
  }
}

