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
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,

      theme: ThemeData(
        fontFamily: 'Geist',
        brightness: Brightness.light,
        primaryColor: const Color(0xFFFF7E55),
        scaffoldBackgroundColor: const Color(0xFFE8F1F5),
      ),

      darkTheme: ThemeData(
        fontFamily: 'Geist',
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFF7E55),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),

      home: const HomeScreen(),
    );
  }
}