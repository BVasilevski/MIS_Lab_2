import 'dart:convert';
import 'package:flutter/material.dart';

import '../../services/api_service.dart';

class JokeTypeJokesScreen extends StatefulWidget {
  final String jokeType;

  const JokeTypeJokesScreen({super.key, required this.jokeType});

  @override
  State<JokeTypeJokesScreen> createState() => _JokeTypeJokesScreenState();
}

class _JokeTypeJokesScreenState extends State<JokeTypeJokesScreen> {
  List<Map<String, dynamic>> jokes = [];

  @override
  void initState() {
    super.initState();
    fetchJokesOfType(widget.jokeType);
  }

  void fetchJokesOfType(String type) async {
    try {
      List<Map<String, dynamic>> fetchedJokes = await ApiService.getJokesByType(type);
      setState(() {
        jokes = fetchedJokes;
      });
    } catch (error) {
      print("Error fetching jokes of type $type: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes of type: ${widget.jokeType}'),
        backgroundColor: Colors.blueAccent,
      ),
      body: jokes.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          var joke = jokes[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(joke['setup']),
              subtitle: Text(joke['punchline']),
            ),
          );
        },
      ),
    );
  }
}
