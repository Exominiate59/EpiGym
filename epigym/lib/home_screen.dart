import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'new_session_screen.dart';
import 'my_routine_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Epigym App")),
      body: Stack(
        children: [
          createCustomButton(
            context: context,
            x: 100,
            y: 100,
            width: 200,
            height: 60,
            text: "New Session",
            color: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewSessionScreen()),
              );
            },
          ),
          createCustomButton(
            context: context,
            x: 100,
            y: 400,
            width: 200,w
            height: 60,
            text: "My Routine",
            color: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyRoutineScreen()),
              );
            },
          ),
          createCustomButton(
          context: context,
          x: 100,
          y: 500,
          width: 200,
          height: 60,
          text: "Pre-made Sessions",
          color: Colors.blue,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewSessionScreen()),
            );
          },
        ),
          createCustomButton(
            context: context,
            x: 100,
            y: 300,
            width: 200,
            height: 60,
            text: "Exercice",
            color: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyRoutineScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
