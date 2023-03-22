import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:flutter_application_1/views/fruityvice_page.dart';
import 'package:flutter_application_1/views/jokes_page.dart';
import 'package:flutter_application_1/views/meteo_page.dart';
import 'package:get/get.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final controller = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [FruityvicePage(), JokesPage(), MeteoPage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 47, 46, 46),
          backgroundColor: const Color.fromRGBO(72, 79, 81, 1),
          currentIndex: controller.tabIndex,
          onTap: controller.changeTabIndex,
          items: [
            _bottombarItem(Icons.nature, "Fruityvice"),
            _bottombarItem(Icons.sports_martial_arts, "Jokes"),
            _bottombarItem(Icons.sunny, "Météo"),
          ],
        ),
      );
    });
  }
}

_bottombarItem(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
