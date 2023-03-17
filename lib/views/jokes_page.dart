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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
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
              child: const Text("Joke"),
            ),
            Text(
              myText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
