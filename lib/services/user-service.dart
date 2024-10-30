import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService {
  final String _baseUrl = "https://dummyjson.com";

  Future<User> getLoggedInUser(String username) async {
    final url = Uri.parse("$_baseUrl/users");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final userJson = data['users'].firstWhere(
        (user) => user['username'] == username,
        orElse: () => null,
      );

      if (userJson != null) {
        return User.fromJson(userJson);
      } else {
        throw Exception("User not found");
      }
    } else {
      throw Exception("Failed to fetch user data");
    }
  }
}
