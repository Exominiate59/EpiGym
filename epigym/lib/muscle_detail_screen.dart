import 'package:flutter/material.dart';

class MuscleDetailScreen extends StatelessWidget {
  final String muscleName;
  final String imagePath; // Ajout du paramètre imagePath

  MuscleDetailScreen({required this.muscleName, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(muscleName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Exercices pour $muscleName",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.asset(
              imagePath,
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
