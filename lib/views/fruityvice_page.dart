import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/remote_service.dart';
import '../models/fruit.dart';

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
    if (fruits != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  _onSearchTextChanged(value) {
    getData(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/fruityvice.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [Colors.black12, Colors.black87])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
        ),
      ),
    );
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
      ),*/