import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import as http
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  Future<void> fetchImage() async {
    try {
      counter++;
      var response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
      var imageModel = ImageModel.fromJson(json.decode(response.body));

      setState(() {
        images.add(imageModel);
      });
    } catch (e) {
      print('Error fetching image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            fetchImage();
          },
        ),
        appBar: AppBar(
          title: const Text("Let's see some images"),
        ),
        body: ImageList(images),
      ),
    );
  }
}
