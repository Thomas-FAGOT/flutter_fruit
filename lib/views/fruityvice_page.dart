import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/joke.dart';
import 'package:flutter_application_1/services/remote_service.dart';

import '../models/fruit.dart';
import '../models/posts.dart';

class FruityvicePage extends StatefulWidget {
  const FruityvicePage({super.key});

  @override
  State<FruityvicePage> createState() => _FruityvicePage();
}

class _FruityvicePage extends State<FruityvicePage> {
  List<Fruit>? fruits;
  var isLoaded = false;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData("all");
  }

  getData(String value) async {
    fruits = (await RemoteService().getFruits(value));
    print(fruits);
    if (fruits != null) {
      setState(() {
        isLoaded = true;
      });
      print(
          "------------------------------------------Fruits------------------------------------------");
    }
  }

  _onSearchTextChanged(value) {
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
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: 'Recherche...',
              hintStyle: TextStyle(color: Colors.grey),
              iconColor: Colors.white,
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
        body: Center());
  }
}
      /*
      appBar: AppBar(
        title: const Text("FRUITYVICE"),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[300],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fruits![index].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito'),
                          ),
                          Text(
                            fruits![index].family,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ))
                    ],
                  ));
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.nature), label: 'fruityvice'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_martial_arts),
              label: 'Chuck Noris jokes'),
          BottomNavigationBarItem(icon: Icon(Icons.sunny), label: 'Météo'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ), */