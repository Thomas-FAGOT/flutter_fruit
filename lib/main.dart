// ignore_for_file: avoid_unnecessary_containers

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'views/home_page.dart';

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
      nextScreen: const HomePage(),
      pageTransitionType: PageTransitionType.rightToLeft,
    );
  }
}

/*
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.orange, Colors.purple])),
        ),
      ),
    );
  }
  
}
*/
