import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/joke.dart';
import 'package:flutter_application_1/services/remote_service.dart';

import '../models/fruit.dart';
import '../models/posts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Fruit>? fruits;
  List<Post>? posts;
  late Joke joke;
  var isLoaded = false;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  getData() async {
    joke = (await RemoteService().getJoke())!;
    if (joke != null) {
      setState(() {
        isLoaded = true;
        print(isLoaded);
      });
    }
    /*
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
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
                            joke!.value,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito'),
                          ),
                          Text(
                            joke!.value,
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
      ),
    );
  }
}
