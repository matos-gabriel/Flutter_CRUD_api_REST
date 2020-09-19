import 'package:simple_flutter_crud/app/data/model/user.dart';
import 'package:http/http.dart' as http;

abstract class IUserRepository {
  Future<http.Response> createUser(User user);
  Future<Map<String, dynamic>> readUsers();
  Future<void> deleteUser(User user);
  Future<void> updateUser(User user);
}
