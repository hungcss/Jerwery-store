import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class UserProfileScreen extends StatelessWidget {
  final String username;

  UserProfileScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.network(
                      user.image,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("First Name: ${user.firstName}",
                      style: TextStyle(fontSize: 18)),
                  Text("Last Name: ${user.lastName}",
                      style: TextStyle(fontSize: 18)),
                  Text("Maiden Name: ${user.maidenName}",
                      style: TextStyle(fontSize: 18)),
                  Text("Age: ${user.age}", style: TextStyle(fontSize: 18)),
                  Text("Phone: ${user.phone}", style: TextStyle(fontSize: 18)),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back to the login screen
                      Navigator.pushReplacementNamed(context,
                          '/'); // Ensure your login route is defined as '/'
                    },
                    child: Text("Checkout"),
                  ),
                ],
              ),
            ),
    );
  }
}
