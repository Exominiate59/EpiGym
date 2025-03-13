import 'package:flutter/material.dart';

class MyRoutineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Routine")),
      body: Center(
        child: Text(
          "Bienvenue dans My Routine",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
