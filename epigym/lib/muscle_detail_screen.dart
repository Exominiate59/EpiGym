import 'package:flutter/material.dart';

class MuscleDetailScreen extends StatelessWidget {
  final String muscleName;

  MuscleDetailScreen({required this.muscleName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(muscleName)),
      body: Center(
        child: Text(
          "Exercices pour $muscleName",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
