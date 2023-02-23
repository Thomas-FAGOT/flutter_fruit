import 'dart:io';

import 'package:flutter_application_1/models/posts.dart';
import 'package:http/http.dart' as http;

import '../models/fruit.dart';

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
}
