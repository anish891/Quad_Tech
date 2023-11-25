import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quad_btech/DetailScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
    if (response.statusCode == 200) {
      setState(() {
        movies = json.decode(response.body);
      });
    } else {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final show = movies[index]['show'];

          if (show == null || show['name'] == null || show['summary'] == null || show['image'] == null || show['image']['medium'] == null) {
            return Container(); // Return an empty container if data is null or missing properties
          }

          return ListTile(
            title: Text(show['name']),
            subtitle: Text(show['summary']),
            leading: show['image']['medium'] != null
                ? Image.network(show['image']['medium'])
                : Container(), // Placeholder or empty container if image is null
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(movie: show),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
