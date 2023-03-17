import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/meteo.dart';
import 'package:flutter_application_1/models/villeV2.dart';
import 'package:flutter_application_1/services/remote_service.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

class MeteoPage extends StatefulWidget {
  const MeteoPage({super.key});

  @override
  State<MeteoPage> createState() => _MeteoPage();
}

class _MeteoPage extends State<MeteoPage> {
  // ------------ Objets ------------ //
  late List<VilleV2> villes;
  late Meteo meteo;

  // ------------ SetState ------------ //
  var isLoaded = false;

  // ------------ Tableau température prevision ------------ //
  var listTemp = List<String>.filled(7, "");

  // ------------ ville ------------ //
  String ville = "Rennes";

  // ------------ Controller pour la barre de recherche ------------ //
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    villes = (await RemoteService().getVilleV2(ville))!;
    meteo = (await RemoteService()
        .getMeteo(double.parse(villes![0].lat), double.parse(villes![0].lon)))!;
    getTempPrev();
    if (villes != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  getTempPrev() {
    for (var i = 0; i < meteo.daily.temperature2MMax.length; i++) {
      listTemp[i] =
          ((meteo.daily.temperature2MMax[i] + meteo.daily.temperature2MMin[i]) /
                  2)
              .toStringAsFixed(0);
    }
  }

  String WeatherCode(int code) {
    String temps = "";
    if (meteo.currentWeather.weathercode < 45) {
      temps = "sunny";
    }

    return temps;
  }

  _onSearchTextChanged(String value) async {
    ville = value;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          controller: _searchController,
          onChanged: _onSearchTextChanged,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: const InputDecoration(
            hintText: 'Recherche...',
            hintStyle: TextStyle(color: Colors.grey),
            iconColor: Colors.white,
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.grey),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: RemoteService().getVilleV2(ville),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('ERREUR : ${snapshot.error}');
          } else {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(villes[0].displayName),
                        Row(
                          children: [
                            const Text("Latitude : "),
                            Text(meteo.latitude.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Longitude : "),
                            Text(meteo.longitude.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Temperature : "),
                            Text(meteo.currentWeather.temperature.toString()),
                            const Text("°C"),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Vitesse du vent : "),
                            Text(meteo.currentWeather.windspeed.toString()),
                            const Text("KmH"),
                          ],
                        ),
                        Row(
                          children: [
                            if (meteo.currentWeather.weathercode < 45)
                              const Icon(WeatherIcons.day_sunny)
                            else if (meteo.currentWeather.weathercode >= 45 &&
                                meteo.currentWeather.weathercode < 61)
                              const Icon(WeatherIcons.cloud)
                            else if (meteo.currentWeather.weathercode >= 61 &&
                                    meteo.currentWeather.weathercode < 71 ||
                                meteo.currentWeather.weathercode >= 80 &&
                                    meteo.currentWeather.weathercode < 85)
                              const Icon(WeatherIcons.rain)
                            else if (meteo.currentWeather.weathercode >= 71 &&
                                    meteo.currentWeather.weathercode < 77 ||
                                meteo.currentWeather.weathercode >= 85 &&
                                    meteo.currentWeather.weathercode < 95)
                              const Icon(WeatherIcons.snow)
                            else if (meteo.currentWeather.weathercode >= 95)
                              const Icon(WeatherIcons.thunderstorm)
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        for (var i = 0; i < listTemp.length; i++)
                          Column(
                            children: [
                              // Date ( Label + Value)
                              Row(
                                children: [
                                  Text(DateFormat('dd/MM/yyyy').format(
                                      DateTime.parse(
                                          meteo.daily.time[i].toString()))),
                                ],
                              ),
                              // Température ( Label + Value)
                              Row(
                                children: [
                                  const Text("Température : "),
                                  Text(listTemp[i]),
                                  const Text("°C")
                                ],
                              ),
                              // Temps ( Label + Value)
                              Row(
                                children: [
                                  if (meteo.daily.weathercode[i] < 45)
                                    const Icon(WeatherIcons.day_sunny)
                                  else if (meteo.daily.weathercode[i] >= 45 &&
                                      meteo.daily.weathercode[i] < 61)
                                    const Icon(WeatherIcons.cloud)
                                  else if (meteo.daily.weathercode[i] >= 61 &&
                                          meteo.daily.weathercode[i] < 71 ||
                                      meteo.daily.weathercode[i] >= 80 &&
                                          meteo.daily.weathercode[i] < 85)
                                    const Icon(WeatherIcons.rain)
                                  else if (meteo.daily.weathercode[i] >= 71 &&
                                          meteo.daily.weathercode[i] < 77 ||
                                      meteo.daily.weathercode[i] >= 85 &&
                                          meteo.daily.weathercode[i] < 95)
                                    const Icon(WeatherIcons.snow)
                                  else if (meteo.daily.weathercode[i] >= 95)
                                    const Icon(WeatherIcons.thunderstorm)
                                ],
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          }
          ;
        },
      ),
    );
  }
}
