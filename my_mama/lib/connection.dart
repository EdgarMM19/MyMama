import 'package:http/http.dart' as http;

class Task {
  final String name;
  final int span;
  final int start;
  final String type;
}

Future<http.Response> fetchPhotos(http.Client client) async {
  return client.get(Uri.parse('http://localhost:8080'));
}