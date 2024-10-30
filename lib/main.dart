import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/auth_provider.dart';
import './providers/cart_provider.dart';
import './screens/login_screen.dart';
import './screens/home_screen.dart';
import './screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AuthProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Jerwery store',
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (ctx) => LoginScreen(),
          '/home': (ctx) {
            // Lấy tên người dùng từ AuthProvider
            final authProvider = Provider.of<AuthProvider>(ctx, listen: false);
            return HomeScreen(username: authProvider.username);
          },
          '/cart': (ctx) => CartScreen(),
        },
      ),
    );
  }
}
