import 'package:flutter/material.dart';

class NewSessionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Session")),
      body: Center(
        child: Text("Bienvenue dans la nouvelle session !",
            style: TextStyle(fontSize: 25)),
      ),
    );
  }
}
