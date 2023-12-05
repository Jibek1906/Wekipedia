import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/intro_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/intropage',
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => MenuPage(),
        '/loginpage': (context) => LoginPage(),
      },
    );
  }
}
