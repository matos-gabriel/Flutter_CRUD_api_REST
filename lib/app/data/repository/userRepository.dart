import 'dart:convert';

import 'package:simple_flutter_crud/app/data/model/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final url = "https://simple-crud-flutter.firebaseio.com";

  Future<http.Response> createUser(User user) {
    return http.post(
      url + "/users.json",
      body: json.encode(
        {"name": user.name, "password": user.password},
      ),
    );
  }

  Future<Map<String, dynamic>> readUsers() async {
    final response = await http.get(url + "/users.json");
    Map<String, dynamic> data = json.decode(response.body);
    return data;
  }
}
