import 'dart:convert';

import 'package:simple_flutter_crud/app/data/model/user.dart';
import 'package:http/http.dart' as http;
import 'IuserRepository.dart';

class UserRepository implements IUserRepository {
  static const _url = "https://simple-crud-flutter.firebaseio.com";

  @override
  Future<http.Response> createUser(User user) {
    try {
      return http.post(
        _url + "/users.json",
        body: json.encode(
          {"name": user.name, "password": user.password},
        ),
      );
    } catch (e) {
      print("error creating user");
    }
  }

  @override
  Future<Map<String, dynamic>> readUsers() async {
    try {
      final response = await http.get(_url + "/users.json");
      Map<String, dynamic> data = json.decode(response.body);
      return data;
    } catch (e) {
      print("error reading users");
    }
  }

  @override
  Future<void> deleteUser(User user) async {
    try {
      await http.delete(_url + "/users/" + "${user.id}.json");
    } catch (e) {
      print("error when deleting user");
    }
  }

  @override
  Future<void> updateUser(User user) async {
    try {
      await http.put(_url + "/users/" + "${user.id}.json",
          body: json.encode({"name": user.name, "password": user.password}));
      return Future.value();
    } catch (e) {
      print("Erro updating user");
    }
  }
}
