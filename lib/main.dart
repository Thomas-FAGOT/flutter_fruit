import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home_page.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}
