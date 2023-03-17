// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'routes/routes.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPage.getnavbar(),
    getPages: AppPage.routes,
  ));
}
