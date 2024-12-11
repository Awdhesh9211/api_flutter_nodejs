import 'dart:convert';
import '../model/user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers() async {
// For Android Emulator: You can use 10.0.2.2 instead of 127.0.0.1 to refer to the host machine's local server.
  final response = await http.get(Uri.parse('http://localhost:4000/'));

  if (response.statusCode == 200) {
    // Parse the response body as a list of users
    List<dynamic> data = json.decode(response.body);

    // Convert the list of maps to a list of User objects
    return data.map((userData) => User.fromJson(userData)).toList();
  } else {
    // If the server does not return a 200 OK response, throw an exception
    throw Exception('Failed to load user data');
  }
}
