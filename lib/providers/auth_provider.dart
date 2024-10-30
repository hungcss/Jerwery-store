import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  // Thêm getter cho username
  String get username =>
      _user?.username ?? ""; // Trả về chuỗi rỗng nếu không có user

  Future<bool> login(String username, String password) async {
    final url = Uri.parse('https://dummyjson.com/users');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List users = json.decode(response.body)['users'];

        for (var userData in users) {
          if (userData['username'] == username) {
            _user = User.fromJson(userData);
            notifyListeners();
            return true;
          }
        }
      }
    } catch (error) {
      print("Error logging in: $error");
    }

    return false; // Đăng nhập thất bại
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
