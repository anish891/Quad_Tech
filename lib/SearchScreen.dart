// lib/screens/search_screen.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for movies...',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              search();
            },
            child: Text('Search'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index]['show']['name']),
                  subtitle: Text(searchResults[index]['show']['summary']),
                  leading: Image.network(searchResults[index]['show']['image']['medium']),
                  onTap: () {
                    Navigator.push(
                      context,
                      // MaterialPageRoute(
                      //   builder: (context) => DetailsScreen(movie: searchResults[index]['show']),
                      // ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> search() async {
    final searchQuery = _searchController.text;
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=$searchQuery'));
    if (response.statusCode == 200) {
      setState(() {
        searchResults = json.decode(response.body);
      });
    } else {
      // Handle error
    }
  }
}
