import 'package:flutter/material.dart';
import 'new_sessions_button.dart';
import 'my_routine_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Epigym',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Epigym App")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NewSessionButton(), // Bouton "New Session"
          SizedBox(height: 20), // Espacement entre les boutons
          MyRoutineButton(),  // Bouton "My Routine"
        ],
      ),
    );
  }
}
