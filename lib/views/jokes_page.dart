import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/joke.dart';
import 'package:flutter_application_1/services/remote_service.dart';

class JokesPage extends StatefulWidget {
  const JokesPage({super.key});

  @override
  State<JokesPage> createState() => _JokesPage();
}

class _JokesPage extends State<JokesPage> {
  late Joke joke;
  bool myNewButton = false;
  String myText = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    joke = (await RemoteService().getJoke())!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/joke.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [Colors.black12, Colors.black45])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    getData();
                    setState(() {
                      myNewButton = true;
                      myText = joke.value;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 47, 46, 46),
                      shape: const CircleBorder(),
                      fixedSize: const Size(110, 110)),
                  child: const Text("Joke"),
                ),
                Container(
                  decoration:
                      const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.6)),
                  child: Text(
                    myText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
