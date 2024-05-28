import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/movie.dart';

class FetchJsonPage extends StatefulWidget {
  const FetchJsonPage({Key? key}) : super(key: key);

  @override
  _JSONDisplayScreenState createState() => _JSONDisplayScreenState();
}

class _JSONDisplayScreenState extends State<FetchJsonPage> {
  List<Movie> tasks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchJSONData();
  }

  Future<void> fetchJSONData() async {
    try {
      final response =
          await http.get(Uri.parse('https://jsonkeeper.com/b/5DQH'));
      if (response.statusCode == 200) {
        print(response.body); // Print the JSON response body
        final List<dynamic> jsonResponse = json.decode(response.body);
        setState(() {
          tasks = jsonResponse.map((data) => Movie.fromJson(data)).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load JSON data');
      }
    } catch (e) {
      print('Error fetching JSON data: $e');
      throw Exception('Failed to load JSON data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Tasks'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text(task.name!),
                    subtitle: Text(task.imdb!),
                    trailing: const Icon(
                      Icons.check_circle,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
