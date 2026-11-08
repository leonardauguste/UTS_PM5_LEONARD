import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App IKLC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Geist',
        primaryColor: const Color(0xFFFF7F50),
        scaffoldBackgroundColor: const Color(0xFFE8F1F5),
      ),
      home: const HomeScreen(),
    );
  }
}