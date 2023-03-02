import 'dart:io';

import 'package:flutter_application_1/models/meteo.dart';
import 'package:flutter_application_1/models/posts.dart';
import 'package:flutter_application_1/models/ville.dart';
import 'package:http/http.dart' as http;

import '../models/fruit.dart';
import '../models/joke.dart';
import '../models/localisation.dart';

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

  Future<List<Fruit>?> getFruits() async {
    var client = http.Client();

    var uri = Uri.parse('https://www.fruityvice.com/api/fruit/all');
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
    }
  }

  Future<Meteo?> getMeteo(double lat, double long) async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&daily=weathercode,temperature_2m_max,temperature_2m_min&current_weather=true&timezone=auto');
    var response = await client.get(uri);
    print(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      print("------------------------Météo------------------------");
      print(json);
      return meteoFromJson(json);
    }
  }

  Future<Localisation?> getLocalisation(double lat, double long) async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://api.opencagedata.com/geocode/v1/json?q=$lat%2C$long&key=01c653336fee4cdfb24705726b83a716');
    var response = await client.get(uri);
    print(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      print("------------------------Localisation------------------------");
      print(json);
      return localisationFromJson(json);
    }
  }

  Future<List<Ville>?> getVille(String ville) async {
    var client = http.Client();
    print(ville);
    var uri = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$ville&dedupe=0&accept-language=fr&countrycodes=fr&limit=5&format=json');
    var response = await client.get(uri);
    print(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      print("------------------------Villes------------------------");
      print(json);
      return villeFromJson(json);
    }
  }
}
