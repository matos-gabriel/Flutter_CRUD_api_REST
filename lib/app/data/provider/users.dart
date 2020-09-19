import 'dart:convert';

import 'package:simple_flutter_crud/app/data/model/user.dart';
import 'package:simple_flutter_crud/app/data/repository/userRepository.dart';

class Users {
  List<User> _users = [];

  get getUsers => [..._users];
  get leght => _users.length;

  Future<void> addUser(User user) async {
    var value = await UserRepository().createUser(user);

    _users.add(
      User(
          id: json.decode(value.body)["name"],
          name: user.name,
          password: user.password),
    );

    return Future.value();
  }

  Future<void> readUsers() async {
    var data = await UserRepository().readUsers();
    data.forEach((key, value) {
      _users
          .add(User(id: key, name: value["name"], password: value["password"]));
    });
    return Future.value();
  }

  Future<void> removeUser(User user) async {
    await UserRepository().deleteUser(user).then((_) => _users.remove(user));

    return Future.value();
  }

  Future<void> updateUser(User user) async {
    try {
      await UserRepository().updateUser(user);
      _users.firstWhere((element) {
        if (element.id == user.id) {
          element.name = user.name;
          element.password = user.password;
        }
        return true;
      });
      return Future.value();
    } catch (e) {
      print("Error: $e");
    }
  }
}
