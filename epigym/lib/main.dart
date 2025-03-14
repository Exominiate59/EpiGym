import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Epigym',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(), // Active le mode sombre
      themeMode: ThemeMode.dark, // Forcer le mode sombre
      home: HomeScreen(),
    );
  }
}
