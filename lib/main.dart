// ignore_for_file: avoid_unnecessary_containers

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/fruityvice_page.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:page_transition/page_transition.dart';
import 'routes/routes.dart';
import 'views/jokes_page.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPage.getnavbar(),
    getPages: AppPage.routes,
  ));
}

/*
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter demo',
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      splash: Column(
        children: [
          Container(
            //color: Colors.red,
            child: const Text(
              'Projet Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Nunito',
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
          Container(
            //color: Colors.blue,
            child: const Text(
              'Sur cette app vous pouvez naviguer sur différents onglets et découvrir de nombreuses API',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Nunito',
              ),
            ),
          ),
        ],
      ),
      nextScreen: const FruityvicePage(),
      pageTransitionType: PageTransitionType.rightToLeft,
    );
  }
}
*/
