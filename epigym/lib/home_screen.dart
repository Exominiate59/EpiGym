import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'new_session_screen.dart';
import 'my_routine_screen.dart';
import 'muscle_selection_screen.dart'; // Importation de la nouvelle page

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 60,
            ),
            const SizedBox(width: 10),
            const Text(
              'Epigym',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 500,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
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
            y: 300,
            width: 200,
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
            y: 400,
            width: 200,
            height: 60,
            text: "Exercice",
            color: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MuscleSelectionScreen()), // Nouvelle page
              );
            },
          ),
        ],
      ),
    );
  }
}
