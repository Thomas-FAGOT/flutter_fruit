import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/meteo.dart';
import 'package:flutter_application_1/services/remote_service.dart';

class MeteoPage extends StatefulWidget {
  const MeteoPage({super.key});

  @override
  State<MeteoPage> createState() => _MeteoPage();
}

class _MeteoPage extends State<MeteoPage> {
  late Meteo meteo;
  var latidue = null;
  var longitude = null;
  var temp = null;
  var windspeed = null;
  var isLoaded = false;
  var listTemp = List<double>.filled(7, 0);

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    meteo = (await RemoteService().getMeteo())!;
    if (meteo != null) {
      setState(() {
        isLoaded = true;
        latidue = meteo.latitude;
        longitude = meteo.longitude;
        temp = meteo.currentWeather.temperature;
        windspeed = meteo.currentWeather.windspeed;
        getTempPrev();
      });
    }
  }

  getTempPrev() {
    for (var i = 0; i < meteo.daily.temperature2MMax.length; i++) {
      listTemp[i] =
          ((meteo.daily.temperature2MMax[i] + meteo.daily.temperature2MMin[i]) /
              2);
      print(listTemp[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Latitude : "),
                      Text('$latidue'),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Longitude : "),
                      Text('$longitude'),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Temperature : "),
                      Text('$temp'),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Vitesse du vent : "),
                      Text('$windspeed'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  /* Doit être fait 7 fois */
                  Column(children: [
                    // Date ( Label + Value)
                    Row(
                      children: [],
                    ),
                    // Température ( Label + Value)
                    Row(
                      children: [],
                    ),
                    // Temps ( Label + Value)
                    Row(
                      children: [],
                    ),
                    //[for (var i in listTemp) Text(i.toString())],
                  ]),
                  /* Doit être fait 7 fois */
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
