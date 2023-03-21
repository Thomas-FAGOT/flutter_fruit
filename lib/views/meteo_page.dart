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

  // ------------ Tableau température prevision ------------ //
  var listTemp = List<String>.filled(7, "");

  // ------------ SetState ------------ //
  var isLoaded = false;

  // ------------ ville ------------ //
  String ville = "Rennes";

  // ------------ Controller pour la barre de recherche ------------ //
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  /// Appel de l'api pour récuper les coordonnées (lat et lon) de la ville demandé
  /// Appel de l'api pour récuper la météo de la ville passé en paramètre
  /// setState pour mettre à jour l'affichage
  getData() async {
    villes = (await RemoteService().getVilleV2(ville))!;
    meteo = (await RemoteService()
        .getMeteo(double.parse(villes![0].lat), double.parse(villes![0].lon)))!;
    getTempPrev();
    // ignore: unnecessary_null_comparison
    if (villes != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  /// l'api météo renvoie la température min et max pour les prochains jours
  /// Cette méthode permet de faire la moyenne des températures et de les récuperer dans un tableau
  getTempPrev() {
    for (var i = 0; i < meteo.daily.temperature2MMax.length; i++) {
      listTemp[i] =
          ((meteo.daily.temperature2MMax[i] + meteo.daily.temperature2MMin[i]) /
                  2)
              .toStringAsFixed(0);
    }
  }

  /// l'api météo renvoie un code permettant de savoir quel temps il fera
  /// Cette méthode permet de remplacer le code par un String correspondant au temps qu'il fera
  String _weatherCode(int code) {
    String temps = "";
    if (code < 45) {
      temps = "sunny";
    } else if (code >= 45 && code < 61) {
      temps = "cloud";
    } else if (code >= 61 && code < 71 || code >= 80 && code < 85) {
      temps = "rain";
    } else if (code >= 71 && code < 77 || code >= 85 && code < 95) {
      temps = "snow";
    } else if (code >= 95) {
      temps = "thunderstorm";
    }
    return temps;
  }

  /// Cette méthode permet de modifier la variable vile et d'appeler la méthode getData qui fera les appels aux API
  _onSearchTextChanged(String value) async {
    ville = value;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/meteo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [Colors.black12, Colors.black87])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
                            Text(
                              villes[0].displayName,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Latitude : ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  meteo.latitude.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Longitude : ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  meteo.longitude.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Temperature : ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  meteo.currentWeather.temperature.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const Text(
                                  "°C",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Vitesse du vent : ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  meteo.currentWeather.windspeed.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const Text(
                                  "KmH",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                if (_weatherCode(
                                        meteo.currentWeather.weathercode) ==
                                    "sunny")
                                  const Icon(
                                    WeatherIcons.day_sunny,
                                    color: Colors.white,
                                  )
                                else if (_weatherCode(
                                        meteo.currentWeather.weathercode) ==
                                    "cloud")
                                  const Icon(
                                    WeatherIcons.cloud,
                                    color: Colors.white,
                                  )
                                else if (_weatherCode(
                                        meteo.currentWeather.weathercode) ==
                                    "rain")
                                  const Icon(
                                    WeatherIcons.rain,
                                    color: Colors.white,
                                  )
                                else if (_weatherCode(
                                        meteo.currentWeather.weathercode) ==
                                    "snow")
                                  const Icon(
                                    WeatherIcons.snow,
                                    color: Colors.white,
                                  )
                                else if (_weatherCode(
                                        meteo.currentWeather.weathercode) ==
                                    "thunderstorm")
                                  const Icon(
                                    WeatherIcons.thunderstorm,
                                    color: Colors.white,
                                  )
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
                                      Text(
                                        DateFormat('dd/MM/yyyy').format(
                                            DateTime.parse(meteo.daily.time[i]
                                                .toString())),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  // Température ( Label + Value)
                                  Row(
                                    children: [
                                      const Text(
                                        "Température : ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        listTemp[i],
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      const Text(
                                        "°C",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  // Temps ( Label + Value)
                                  Row(
                                    children: [
                                      if (_weatherCode(
                                              meteo.daily.weathercode[i]) ==
                                          "sunny")
                                        const Icon(
                                          WeatherIcons.day_sunny,
                                          color: Colors.white,
                                        )
                                      else if (_weatherCode(
                                              meteo.daily.weathercode[i]) ==
                                          "cloud")
                                        const Icon(WeatherIcons.cloud,
                                            color: Colors.white)
                                      else if (_weatherCode(
                                              meteo.daily.weathercode[i]) ==
                                          "rain")
                                        const Icon(WeatherIcons.rain,
                                            color: Colors.white)
                                      else if (_weatherCode(
                                              meteo.daily.weathercode[i]) ==
                                          "snow")
                                        const Icon(WeatherIcons.snow,
                                            color: Colors.white)
                                      else if (_weatherCode(
                                              meteo.daily.weathercode[i]) ==
                                          "thunderstorm")
                                        const Icon(WeatherIcons.thunderstorm,
                                            color: Colors.white)
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
        ),
      ),
    );
  }
}
