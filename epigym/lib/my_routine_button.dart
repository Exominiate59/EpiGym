import 'package:flutter/material.dart';
import 'my_routine_screen.dart'; // Utilisation de la même page pour l'instant

class MyRoutineButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyRoutineScreen()), // Change si tu veux une autre page
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
        ),
        child: Text("My Routine"),
      ),
    );
  }
}
