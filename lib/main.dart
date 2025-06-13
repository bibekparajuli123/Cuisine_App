import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/intro_page.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/menu_page.dart';
import 'pages/cart_page.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => CartProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/menupage': (context) => const MenuPage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
