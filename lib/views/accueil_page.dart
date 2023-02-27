/**
 * import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home_page.dart';

import 'views/accueil_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget title1 = Container(
    child: Column(
      children: const [Text("BIENVENUE"), Text("SUR FRUITYVICE")],
    ),
  );

  Widget title2 = Container(
    child: const Text(
        "Fruityvice est une application mobile permettant de rechercher un fruit pour connaitre sa valeur nutritionnel"),
  );

  Widget addFruit = Container(
    child: TextButton(
      style:
          ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.blue)),
      onPressed: () {},
      child: Text("Ajouter un fruit"),
    ),
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen.navigate(
        name: 'intro.flr',
        next: (context) => AccueilPage(),
        until: () => Future.delayed(Duration(seconds: 1)),
        startAnimation: '1',
      ),
    );
  }
}
 */