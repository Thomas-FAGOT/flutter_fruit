import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/localisation.dart';
import 'package:flutter_application_1/models/meteo.dart';
import 'package:flutter_application_1/models/ville.dart';
import 'package:flutter_application_1/services/remote_service.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

class MeteoPage extends StatefulWidget {
  const MeteoPage({super.key});

  @override
  State<MeteoPage> createState() => _MeteoPage();
}

class _MeteoPage extends State<MeteoPage> {
  late Meteo meteo;
  late Localisation localisation;
  List<Ville>? villes;

  // Variables Nav Bar
  final TextEditingController _searchController = TextEditingController();

  var isLoaded = false;
  var villesIsLoaded = false;
  var listTemp = List<String>.filled(7, "");

  @override
  void initState() {
    super.initState();
    getData("Brest");
  }

  getData(String ville) async {
    villes = (await RemoteService().getVille(ville))!;
    if (villes != null) {
      villesIsLoaded = true;
    }
    print("Météo");
    meteo = (await RemoteService()
        .getMeteo(double.parse(villes![0].lat), double.parse(villes![0].lon)))!;
    if (meteo != null) {
      setState(() {
        isLoaded = true;
        getTempPrev();
      });
    }
    localisation = (await RemoteService().getLocalisation(
        double.parse(villes![0].lat), double.parse(villes![0].lon)))!;
    print("Localisation");
    print(localisation);
    if (localisation != null) {
      setState(() {
        isLoaded = true;
        print(localisation.results[0].formatted);
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

  _onSearchTextChanged(String value) async {
    getData(value);
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
      body: FutureBuilder<List<Ville>?>(
        future: RemoteService().getVille("Brest"),
        builder: (BuildContext context, AsyncSnapshot<List<Ville>?> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(localisation.results[0].formatted),
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
                          Container(
                            child: Column(
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
                                //[for (var i in listTemp) Text(i.toString())],
                              ],
                            ),
                            /* Doit être fait 7 fois */
                          ),
                      ],
                    )
                  ],
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          ;
        },
      ),
    );
  }
}

          /*
child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for (var i = 0; i < listTemp.length; i++)
            Container(
              child: Column(
                children: [
                  // Date ( Label + Value)
                  Row(
                    children: [
                      Text(DateFormat('dd/MM/yyyy').format(
                          DateTime.parse(meteo.daily.time[i].toString()))),
                    ],
                  ),
                  // Température ( Label + Value)
                  Row(
                    children: [
                      Text("Température : "),
                      Text(listTemp[i]),
                      Text("°C")
                    ],
                  ),
                  // Temps ( Label + Value)
                  Row(
                    children: [
                      if (meteo.daily.weathercode[i] < 45)
                        Icon(WeatherIcons.day_sunny)
                      else if (meteo.daily.weathercode[i] >= 45 &&
                          meteo.daily.weathercode[i] < 61)
                        Icon(WeatherIcons.cloud)
                      else if (meteo.daily.weathercode[i] >= 61 &&
                              meteo.daily.weathercode[i] < 71 ||
                          meteo.daily.weathercode[i] >= 80 &&
                              meteo.daily.weathercode[i] < 85)
                        Icon(WeatherIcons.rain)
                      else if (meteo.daily.weathercode[i] >= 71 &&
                              meteo.daily.weathercode[i] < 77 ||
                          meteo.daily.weathercode[i] >= 85 &&
                              meteo.daily.weathercode[i] < 95)
                        Icon(WeatherIcons.snow)
                      else if (meteo.daily.weathercode[i] >= 95)
                        Icon(WeatherIcons.thunderstorm)
                    ],
                  ),
                  //[for (var i in listTemp) Text(i.toString())],
                ],
              ),
              /* Doit être fait 7 fois */
            ),
        ],
      )

          --------------------------------------------------------------------
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text(localisation.results[0].formatted),
                    Row(
                      children: [
                        Text("Latitude : "),
                        Text(meteo.latitude.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Longitude : "),
                        Text(meteo.longitude.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Temperature : "),
                        Text(meteo.currentWeather.temperature.toString()),
                        Text("°C"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Vitesse du vent : "),
                        Text(meteo.currentWeather.windspeed.toString()),
                        Text("KmH"),
                      ],
                    ),
                    Row(
                      children: [
                        if (meteo.currentWeather.weathercode < 45)
                          Icon(WeatherIcons.day_sunny)
                        else if (meteo.currentWeather.weathercode >= 45 &&
                            meteo.currentWeather.weathercode < 61)
                          Icon(WeatherIcons.cloud)
                        else if (meteo.currentWeather.weathercode >= 61 &&
                                meteo.currentWeather.weathercode < 71 ||
                            meteo.currentWeather.weathercode >= 80 &&
                                meteo.currentWeather.weathercode < 85)
                          Icon(WeatherIcons.rain)
                        else if (meteo.currentWeather.weathercode >= 71 &&
                                meteo.currentWeather.weathercode < 77 ||
                            meteo.currentWeather.weathercode >= 85 &&
                                meteo.currentWeather.weathercode < 95)
                          Icon(WeatherIcons.snow)
                        else if (meteo.currentWeather.weathercode >= 95)
                          Icon(WeatherIcons.thunderstorm)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            /*
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    /* Doit être fait 7 fois */
                    for (var i = 0; i < listTemp.length; i++)
                      Column(children: [
                        // Date ( Label + Value)
                        Row(
                          children: [
                            Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(
                                meteo.daily.time[i].toString()))),
                          ],
                        ),
                        // Température ( Label + Value)
                        Row(
                          children: [
                            Text("Température : "),
                            Text(listTemp[i]),
                            Text("°C")
                          ],
                        ),
                        // Temps ( Label + Value)
                        Row(
                          children: [
                            if (meteo.daily.weathercode[i] < 45)
                              Icon(WeatherIcons.day_sunny)
                            else if (meteo.daily.weathercode[i] >= 45 &&
                                meteo.daily.weathercode[i] < 61)
                              Icon(WeatherIcons.cloud)
                            else if (meteo.daily.weathercode[i] >= 61 &&
                                    meteo.daily.weathercode[i] < 71 ||
                                meteo.daily.weathercode[i] >= 80 &&
                                    meteo.daily.weathercode[i] < 85)
                              Icon(WeatherIcons.rain)
                            else if (meteo.daily.weathercode[i] >= 71 &&
                                    meteo.daily.weathercode[i] < 77 ||
                                meteo.daily.weathercode[i] >= 85 &&
                                    meteo.daily.weathercode[i] < 95)
                              Icon(WeatherIcons.snow)
                            else if (meteo.daily.weathercode[i] >= 95)
                              Icon(WeatherIcons.thunderstorm)
                          ],
                        ),
                        //[for (var i in listTemp) Text(i.toString())],
                      ]),
                    /* Doit être fait 7 fois */
                  ],
                ),
              ),
            )*/
          ],
        ),*/