import 'package:flutter_application_1/models/meteo.dart';
import 'package:flutter_application_1/models/villeV2.dart';
import 'package:http/http.dart' as http;

import '../models/fruit.dart';
import '../models/joke.dart';

class RemoteService {
  Future<List<Fruit>?> getFruits(String value) async {
    var client = http.Client();

    var uri = Uri.parse('https://www.fruityvice.com/api/fruit/$value');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return fruitFromJson(json);
    }
  }

  Future<Joke?> getJoke() async {
    var client = http.Client();

    var uri = Uri.parse('https://api.chucknorris.io/jokes/random');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return jokeFromJson(json);
    } else {
      return null;
    }
  }

  Future<List<VilleV2>?> getVilleV2(String ville) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$ville&dedupe=0&accept-language=fr&countrycodes=fr&limit=5&format=json');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return villeV2FromJson(json);
    } else {
      return null;
    }
  }

  Future<Meteo?> getMeteo(double lat, double long) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&daily=weathercode,temperature_2m_max,temperature_2m_min&current_weather=true&timezone=auto');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return meteoFromJson(json);
    } else {
      return null;
    }
  }
}
