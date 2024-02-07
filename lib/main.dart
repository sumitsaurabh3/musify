import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Notify notify=Get.put(Notify());
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
