import 'dart:convert';

import 'package:simple_flutter_crud/app/data/model/user.dart';
import 'package:simple_flutter_crud/app/data/repository/userRepository.dart';

class Users {
  List<User> users = [];

  get leght => users.length;

  void addUser(User user) {
    UserRepository().createUser(user).then(
          (value) => users.add(
            User(
                id: json.decode(value.body)["name"],
                name: user.name,
                password: user.password),
          ),
        );
  }

  Future<void> readUsers() async {
    var data = await UserRepository().readUsers();
    data.forEach((key, value) {
      users
          .add(User(id: key, name: value["name"], password: value["password"]));
    });
    return Future.value();
  }

  void removeUser(User user) {
    users.remove(user.id);
  }
}
