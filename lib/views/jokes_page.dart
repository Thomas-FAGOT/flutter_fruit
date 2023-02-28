import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/joke.dart';
import 'package:flutter_application_1/services/remote_service.dart';

import '../models/fruit.dart';
import '../models/posts.dart';

class JokesPage extends StatefulWidget {
  const JokesPage({super.key});

  @override
  State<JokesPage> createState() => _JokesPage();
}

class _JokesPage extends State<JokesPage> {
  late Joke joke;
  var isLoaded = false;
  bool myNewButton = false;
  String myText = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    joke = (await RemoteService().getJoke())!;
    if (joke != null) {
      setState(() {
        isLoaded = true;
        print(isLoaded);
        print(joke.value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Vous voulez une blague ?"),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
              ),
              onPressed: () async {
                getData();
                setState(() {
                  myNewButton = true;
                  myText = joke.value;
                });
              },
            ),
            Text(
              myText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      /*
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
      ),*/
    );
  }
}
