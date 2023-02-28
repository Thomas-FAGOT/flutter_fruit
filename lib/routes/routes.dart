import 'package:flutter_application_1/navbar/navbar.dart';
import 'package:flutter_application_1/views/fruityvice_page.dart';
import 'package:flutter_application_1/views/jokes_page.dart';
import 'package:flutter_application_1/views/meteo_page.dart';
import 'package:get/get.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const NavBar()),
    GetPage(name: fruityvice, page: () => const FruityvicePage()),
    GetPage(name: jokes, page: () => const JokesPage()),
    GetPage(name: meteo, page: () => const MeteoPage()),
  ];
  //
  static getnavbar() => navbar;
  static getfruityvice() => fruityvice;
  static getjokes() => jokes;
  static getmeteo() => meteo;
  //
  static String navbar = '/';
  static String fruityvice = '/fruityvice';
  static String jokes = '/jokes';
  static String meteo = '/meteo';
}
