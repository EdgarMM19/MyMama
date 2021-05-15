import 'package:http/http.dart' as http;
import 'dart:convert';

class Task {
  String name;
  int span;
  int start;
  String type;

  Task(name, span, start, type) {
    this.name = name;
    this.span = span;
    this.start = start;
    this.type = type;
  }

  Task.fromJson(Map<String, dynamic> json) {
    this.name = json['name'] as String;
    this.span = json['span'] as int;
    this.start = json['start_time'] as int;
    this.type = json['type'] as String;
  }
}

// A function that converts a response body into a List<Photo>.
List<Task> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Task>((json) => Task.fromJson(json)).toList();
}

Future<List<Task>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse('http://localhost:8080'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return parsePhotos(response.body);
}
