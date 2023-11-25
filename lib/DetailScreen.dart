// lib/screens/details_screen.dart

import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> movie;

  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(movie['image']['original']),
            SizedBox(height: 16),
            Text(
              movie['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              movie['summary'],
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
