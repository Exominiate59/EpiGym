import 'package:flutter/material.dart';

class MyRoutineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Routine")),
      body: Center(
        child: Text("You're Gay", style: TextStyle(fontSize: 70)),
      ),
    );
  }
}
