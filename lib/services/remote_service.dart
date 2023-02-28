import 'dart:io';

import 'package:flutter_application_1/models/meteo.dart';
import 'package:flutter_application_1/models/posts.dart';
import 'package:http/http.dart' as http;

import '../models/fruit.dart';
import '../models/joke.dart';

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

  Future<Meteo?> getMeteo() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=48.11&longitude=-1.62&daily=weathercode,temperature_2m_max,temperature_2m_min&current_weather=true&timezone=auto');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return meteoFromJson(json);
    }
  }
}
